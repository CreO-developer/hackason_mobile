import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント画面'),
      ),
      body: Center(
        child: const Text('こちらはアカウント画面です'),
      ),
    );
  }
}
