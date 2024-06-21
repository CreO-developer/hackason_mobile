import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/presentation/screens/post_screen.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ここで依存関係にアクセスします
    final authState = ref.watch(authNotifierProvider);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    userInfoNotifier.setUserInfo(authState!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoState = ref.watch(userInfoNotifierProvider);
    print(userInfoState);

    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント画面'),
      ),
      body: Column(
        children: [
          Center(
            child: const Text('こちらはアカウント画面です'),
          ),
          Center(
            child: ElevatedButton(
              child: Text('ログアウト'),
              onPressed: () async {
                final result = await authNotifier.logoutUser();
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3列に設定
                crossAxisSpacing: 8.0, // 列間のスペース
                mainAxisSpacing: 8.0, // 行間のスペース
              ),
              itemCount: userInfoState?.posts.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Image.network("https://via.placeholder.com/480x640"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
