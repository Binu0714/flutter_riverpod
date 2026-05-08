import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';

class UserProfilePage extends ConsumerWidget {
  final int userId;
  const UserProfilePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(asyncUserProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: userAsync.when(
        data: (user) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
              const SizedBox(height: 20),
              Text(user.name, style: Theme.of(context).textTheme.headlineMedium),
              Text(user.email, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}