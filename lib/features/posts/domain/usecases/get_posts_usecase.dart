import 'package:dartz/dartz.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../../../../core/errors/failure.dart';

class GetPostsUseCase {
  final PostRepository repository;
  GetPostsUseCase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getPosts();
  }
}