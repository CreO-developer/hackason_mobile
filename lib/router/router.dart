import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/screens/login_screen.dart';
import 'package:mobile/presentation/screens/account_screen.dart';
import 'package:mobile/presentation/screens/home_screen.dart';
import 'package:mobile/presentation/screens/ranking_screen.dart';
import 'package:mobile/widget/BottomNavWidget.dart';
import 'package:path/path.dart';

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
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
      ],
      redirect: (context, state) async {
        print('redirecting...');

        if (auth == null) {
          return '/login';
        }
        return null;
      });
}
