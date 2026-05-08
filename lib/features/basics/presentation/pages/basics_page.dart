import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/basics_providers.dart';

class BasicsPage extends ConsumerWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final theme = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Basics")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $counter", style: const TextStyle(fontSize: 32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).state++, child: const Icon(Icons.add)),
                ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).state--, child: const Icon(Icons.remove)),
              ],
            ),
            const Divider(),
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: theme == ThemeMode.dark,
              onChanged: (val) => ref.read(themeModeProvider.notifier).state = val ? ThemeMode.dark : ThemeMode.light,
            )
          ],
        ),
      ),
    );
  }
}