// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCF1D4),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 120),
              const Text(
                'パスワードの再登録',
                style: TextStyle(color: Color(0xFF2D6486), fontSize: 24),
              ),
              const SizedBox(height: 20),
              const Text('送られてくるメールからパスワードの再設定をお願いします。'),
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('送信'),
                  onPressed: () async {
                    await authNotifier.resetPassword(emailController.text);
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
