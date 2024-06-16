import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard, size: 30), // アイコンサイズを設定
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), // アイコンサイズを設定
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 30), // アイコンサイズを設定
            label: '',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: Colors.red, // 選択されたアイコンの色
        unselectedItemColor: Colors.grey, // 選択されていないアイコンの色
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        type: BottomNavigationBarType.fixed, // この設定でアイテムが均等に分布
        showSelectedLabels: false, // 選択されたラベルを表示しない
        showUnselectedLabels: false, // 選択されていないラベルを表示しない
      ),
    );
  }
}
