// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'451525319d5af7c5e562168461dda251e4bec076';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$postRemoteDataSourceHash() =>
    r'fcd8be32646675c2cde903f7b8faa324cd8c49c6';

/// See also [postRemoteDataSource].
@ProviderFor(postRemoteDataSource)
final postRemoteDataSourceProvider =
    AutoDisposeProvider<PostRemoteDataSource>.internal(
      postRemoteDataSource,
      name: r'postRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$postRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PostRemoteDataSourceRef = AutoDisposeProviderRef<PostRemoteDataSource>;
String _$postRepositoryHash() => r'55298e4ffb93c0b108d55a7b42281c56a8281b28';

/// See also [postRepository].
@ProviderFor(postRepository)
final postRepositoryProvider = AutoDisposeProvider<PostRepository>.internal(
  postRepository,
  name: r'postRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PostRepositoryRef = AutoDisposeProviderRef<PostRepository>;
String _$getPostsUseCaseHash() => r'f9762ab1663c7747b2a2a248807dbdbc8df4e8e2';

/// See also [getPostsUseCase].
@ProviderFor(getPostsUseCase)
final getPostsUseCaseProvider = AutoDisposeProvider<GetPostsUseCase>.internal(
  getPostsUseCase,
  name: r'getPostsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPostsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPostsUseCaseRef = AutoDisposeProviderRef<GetPostsUseCase>;
String _$asyncPostsHash() => r'2cb0f463102adca8555e9f1a875e76a845118816';

/// See also [AsyncPosts].
@ProviderFor(AsyncPosts)
final asyncPostsProvider =
    AutoDisposeAsyncNotifierProvider<AsyncPosts, List<Post>>.internal(
      AsyncPosts.new,
      name: r'asyncPostsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$asyncPostsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AsyncPosts = AutoDisposeAsyncNotifier<List<Post>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
