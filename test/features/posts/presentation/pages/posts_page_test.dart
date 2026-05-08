import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_riverpod_app/features/posts/presentation/pages/posts_page.dart';

void main() {
  testWidgets('PostsPage should show loading indicator initially', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: PostsPage()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}