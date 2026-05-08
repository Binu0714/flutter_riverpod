import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../posts/presentation/providers/post_providers.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user.dart';

part 'user_provider.g.dart';

@riverpod
class AsyncUser extends _$AsyncUser {
  @override
  FutureOr<User> build(int userId) async {
    final repo = UserRepositoryImpl(ref.watch(dioProvider));
    final result = await repo.getUser(userId);
    return result.fold((f) => throw f.message, (user) => user);
  }
}