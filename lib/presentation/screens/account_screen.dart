import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(authNotifierProvider.notifier);

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
                final result = await loginController.logoutUser();
              },
            ),
          )
        ],
      ),
    );
  }
}
