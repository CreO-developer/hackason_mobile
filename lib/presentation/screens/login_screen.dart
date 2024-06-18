// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(authNotifierProvider.notifier);
    final userNameController = TextEditingController();
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
                controller: userNameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                controller: emailController,
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
                    final result = await loginController.registerUser(emailController.text, passwordController.text);
                    // if (result != null) {
                    //   Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) {
                    //       return Container(child: Text('aaa'),);
                    //     }),
                    //   );
                    // }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () async {
                    final result = await loginController.lgoinUser(emailController.text, passwordController.text);
                    if (result != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return Container(child: Text('aaa'),);
                        }),
                      );
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