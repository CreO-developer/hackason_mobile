// login_page.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF1D4),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            context.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 120),
              Text(
                'パスワードの再登録',
                style: TextStyle(color: Color(0xFF2D6486), fontSize: 24),
              ),
              SizedBox(height: 20),
                            Text('送られてくるメールからパスワードの再設定をお願いします。'),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'メールアドレス',
                    style: TextStyle(
                        color: Color(0xFF54BD6B),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      userInfoNotifier.setEmail(value);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('送信'),
                  onPressed: () async {
                    final result = await authNotifier.resetPassword(
                        emailController.text);
                    // if (result == null) {
                    //   print('パスワードの再設定に失敗しました');
                    // }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
