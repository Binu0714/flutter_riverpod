import 'package:dio/dio.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> fetchPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;
  PostRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PostModel>> fetchPosts() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}