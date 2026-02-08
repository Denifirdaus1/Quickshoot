import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/map_of_photography_page.dart';
import '../../features/profile/presentation/pages/photography_profile_page.dart';
import '../../features/profile/presentation/pages/user_profile_page.dart';
import '../../features/profile/presentation/pages/user_banned_page.dart';
import '../../features/profile/presentation/pages/edit_profile_page.dart';
import '../../features/profile/presentation/pages/account_details_page.dart';
import '../../features/profile/presentation/pages/edit_review_page.dart';
import '../../features/profile/presentation/pages/support_chat_page.dart';
import '../../features/chat/presentation/pages/inbox_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/user_image_purchase/presentation/pages/my_shoots_page.dart';
import '../../features/user_image_purchase/presentation/pages/locked_file_page.dart';
import '../../features/user_image_purchase/presentation/pages/unlocked_file_page.dart';

/// App router configuration using GoRouter
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const UserProfilePage(),
      ),
      GoRoute(
        path: '/user-banned',
        name: 'user_banned',
        builder: (context, state) => const UserBannedPage(),
      ),
      GoRoute(
        path: '/edit-profile',
        name: 'edit_profile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/account-details',
        name: 'account_details',
        builder: (context, state) => const AccountDetailsPage(),
      ),
      GoRoute(
        path: '/edit-review',
        name: 'edit_review',
        builder: (context, state) => const EditReviewPage(),
      ),
      GoRoute(
        path: '/support-chat',
        name: 'support_chat',
        builder: (context, state) => const SupportChatPage(),
      ),
      GoRoute(
        path: '/photographer-profile',
        name: 'photographer_profile',
        builder: (context, state) => const PhotographyProfilePage(),
      ),
      GoRoute(
        path: '/inbox',
        name: 'inbox',
        builder: (context, state) => const InboxPage(),
      ),
      GoRoute(
        path: '/chat/:id',
        name: 'chat',
        builder: (context, state) {
          // In a real app, fetch user details based on ID from state.pathParameters['id']
          return const ChatPage();
        },
      ),
      GoRoute(
        path: '/my-shoots',
        name: 'my_shoots',
        builder: (context, state) => const MyShootsPage(),
      ),
      GoRoute(
        path: '/locked-file',
        name: 'locked_file',
        builder: (context, state) => const LockedFilePage(),
      ),
      GoRoute(
        path: '/unlocked-file',
        name: 'unlocked_file',
        builder: (context, state) => const UnlockedFilePage(),
      ),
      GoRoute(
        path: '/map-of-photography',
        name: 'map_of_photography',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MapOfPhotographyPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeOut;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.path}')),
    ),
  );
}
