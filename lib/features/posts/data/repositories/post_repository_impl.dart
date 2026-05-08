import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../sources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final models = await remoteDataSource.fetchPosts();
      return Right(models);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}