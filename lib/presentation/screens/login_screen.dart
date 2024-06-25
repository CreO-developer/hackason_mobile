import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
              top: 50,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
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
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'パスワード'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await authNotifier.lgoinUser(
                        emailController.text, passwordController.text);
                    if (result == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ログインに失敗しました')));
                    } else {
                      userInfoNotifier.setUserInfo(result.user!.uid);
                      context.push('/home');
                    }
                  },
                  child: const Text('ログイン'),
                ),
                const SizedBox(height: 40),
                _buildRichText(context, 'アカウントの作成は', '/signup'),
                const SizedBox(height: 10),
                _buildRichText(context, 'パスワードを忘れた場合は', '/forgotPassword')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRichText(BuildContext context, String text, String route) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: text,
              style: const TextStyle(
                  color: Color(0xFFC93429),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          TextSpan(
            text: 'こちら',
            style: const TextStyle(
                color: Color(0xFFC93429),
                decoration: TextDecoration.underline,
                fontSize: 12,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.push(route),
          ),
        ],
      ),
    );
  }
}
