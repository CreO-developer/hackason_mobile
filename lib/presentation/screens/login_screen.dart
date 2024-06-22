// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'ニックネーム'),
                onChanged: (value) {
                  userInfoNotifier.setName(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                controller: emailController,
                onChanged: (value) {
                  userInfoNotifier.setEmail(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                controller: passwordController,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('ユーザー登録'),
                  onPressed: () async {
                    final result = await authNotifier.registerUser(
                        emailController.text, passwordController.text);
                    print(result);
                    await userInfoNotifier.createUserInfo(result!.user!.uid);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () async {
                    final result = await authNotifier.lgoinUser(
                        emailController.text, passwordController.text);
                    if (result == null) {
                      print('ログインに失敗しました');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
