import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/sources/post_remote_data_source.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import '../../domain/entities/post.dart';
import '../../../../core/network/logging_interceptor.dart';

part 'post_providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(LoggingInterceptor());
  return dio;
}

@riverpod
PostRemoteDataSource postRemoteDataSource(PostRemoteDataSourceRef ref) =>
    PostRemoteDataSourceImpl(ref.watch(dioProvider));

@riverpod
PostRepository postRepository(PostRepositoryRef ref) =>
    PostRepositoryImpl(ref.watch(postRemoteDataSourceProvider));

@riverpod
GetPostsUseCase getPostsUseCase(GetPostsUseCaseRef ref) =>
    GetPostsUseCase(ref.watch(postRepositoryProvider));

@riverpod
class AsyncPosts extends _$AsyncPosts {
  @override
  FutureOr<List<Post>> build() async {
    final usecase = ref.watch(getPostsUseCaseProvider);
    final result = await usecase.call();
    return result.fold(
          (failure) => throw failure.message,
          (posts) => posts,
    );
  }
}