import '../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<void> cachePosts(List<PostModel> posts);
  Future<List<PostModel>> getLastPosts();
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  // Simulating SharedPreferences storage
  List<PostModel> _cachedPosts = [];

  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    _cachedPosts = posts;
  }

  @override
  Future<List<PostModel>> getLastPosts() async {
    if (_cachedPosts.isNotEmpty) return _cachedPosts;
    throw Exception("No Cache Found");
  }
}