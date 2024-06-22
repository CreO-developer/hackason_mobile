import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/screens/login_screen.dart';
import 'package:mobile/presentation/screens/account_screen.dart';
import 'package:mobile/presentation/screens/home_screen.dart';
import 'package:mobile/presentation/screens/question/question_screen1.dart';
import 'package:mobile/presentation/screens/question/question_screen2.dart';
import 'package:mobile/presentation/screens/question/question_screen3.dart';
import 'package:mobile/presentation/screens/post_screen.dart';
import 'package:mobile/presentation/screens/question/question_screen4.dart';

import 'package:mobile/presentation/screens/ranking_screen.dart';
import 'package:mobile/presentation/screens/result_screen.dart';
import 'package:mobile/presentation/screens/sign_up_screen.dart';
import 'package:mobile/widget/BottomNavWidget.dart';

GoRouter CustomRouter(WidgetRef ref) {
  final auth = ref.watch(authNotifierProvider);

  return GoRouter(
      // debugLogDiagnostics: true はデバッグ用
      debugLogDiagnostics: true,
      initialLocation: '/ranking',
      // パスと画面の組み合わせ

      routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              // Check if the current route is 'home/question'
              final location = state.uri.toString();
              if (location == 'home/question1' ||
                  location == 'home/question2' ||
                  location == 'home/question3' ||
                  location == 'home/question4' ||
                  location == 'home/result') {
                // Return only the navigationShell content without the AppNavigationBar
                return navigationShell;
              } else {
                // Return the AppNavigationBar
                return AppNavigationBar(navigationShell: navigationShell);
              }
            },
            branches: [
              // ランキングブランチ
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/ranking',
                    pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: const RankingScreen(),
                    ),
                  ),
                ],
              ),

              // homeブランチ
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/',
                    pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: HomeScreen(),
                    ),
                  ),
                  GoRoute(
                    path: '/home',
                    pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: HomeScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: 'question1',
                        builder: (context, state) => QuestionScreen1(),
                      ),
                      GoRoute(
                        path: 'question2',
                        builder: (context, state) => QuestionScreen2(),
                      ),
                      GoRoute(
                        path: 'question3',
                        builder: (context, state) => QuestionScreen3(),
                      ),
                      GoRoute(
                        path: 'question4',
                        builder: (context, state) => QuestionScreen4(),
                      ),
                      GoRoute(
                        path: 'result',
                        pageBuilder: (context, state) => MaterialPage(
                          key: state.pageKey,
                          child: ResultScreen(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // likeブランチ

              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/account',
                    pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: const AccountScreen(),
                    ),
                  ),
                ],
              ),

              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/ranking/post',
                    pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: PostScreen(),
                    ),
                  ),
                ],
              ),
              // profileブランチ
            ]),
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignUpScreen(),
        ),
      ],
      redirect: (context, state) async {
        print('redirecting...');

        if (auth == null && state.fullPath != '/signup') {
          return '/login';
        }
        return null;
      });
}
