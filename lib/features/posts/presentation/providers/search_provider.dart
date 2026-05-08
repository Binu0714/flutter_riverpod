import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/post.dart';
import 'post_providers.dart';

part 'search_provider.g.dart';

@riverpod
class PostSearch extends _$PostSearch {
  Timer? _debounce;

  @override
  FutureOr<List<Post>> build() => [];

  void search(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      if (query.isEmpty) {
        state = const AsyncValue.data([]);
        return;
      }
      state = const AsyncValue.loading();
      final allPosts = await ref.read(asyncPostsProvider.future);
      final filtered = allPosts.where((p) =>
          p.title.toLowerCase().contains(query.toLowerCase())).toList();
      state = AsyncValue.data(filtered);
    });
  }
}