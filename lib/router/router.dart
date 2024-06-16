import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/account_screen.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/ranking_screen.dart';
import 'package:mobile/widget/BottomNavWidget.dart';

final router = GoRouter(
    // debugLogDiagnostics: true はデバッグ用
    debugLogDiagnostics: true,
    initialLocation: '/ranking',
    // パスと画面の組み合わせ

    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AppNavigationBar(navigationShell: navigationShell);
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
                  path: '/home',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: HomeScreen(),
                  ),
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
            // profileブランチ
          ]),
    ]);
