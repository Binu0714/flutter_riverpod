import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../sources/post_remote_data_source.dart';
import '../sources/post_local_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remote;
  final PostLocalDataSource local;
  PostRepositoryImpl(this.remote, this.local);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final remotePosts = await remote.fetchPosts();
      await local.cachePosts(remotePosts);
      return Right(remotePosts);
    } catch (e) {
      try {
        final localPosts = await local.getLastPosts();
        return Right(localPosts);
      } catch (_) {
        return Left(ServerFailure("Network error and no cache found"));
      }
    }
  }
}