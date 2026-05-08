import 'package:go_router/go_router.dart';
import '../../features/posts/presentation/pages/posts_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/user/presentation/pages/user_profile_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const PostsPage()),
    GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
    GoRoute(
      path: '/user/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return UserProfilePage(userId: id);
      },
    ),
  ],
);