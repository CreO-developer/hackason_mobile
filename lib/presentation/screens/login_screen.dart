// login_page.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'ログイン',
                style: TextStyle(color: Color(0xFF2D6486), fontSize: 24),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'パスワード',
                    style: TextStyle(
                        color: Color(0xFF54BD6B),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    final result = await authNotifier.lgoinUser(
                        emailController.text, passwordController.text);
                    if (result == null) {
                      print('ログインに失敗しました');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ログインに失敗しました'),
                        ),
                      );
                    } else {
                      userInfoNotifier.setUserInfo(result!.user!.uid);
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: "アカウントの作成は",
                        style: TextStyle(
                            color: Color(0xFFC93429),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: "こちら",
                      style: const TextStyle(
                          color: Color(0xFFC93429),
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push('/signup');
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: "パスワードを忘れた場合は",
                        style: TextStyle(
                            color: Color(0xFFC93429),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: "こちら",
                      style: const TextStyle(
                          color: Color(0xFFC93429),
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push('/forgotPassword');
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
