import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/firebase_auth_error.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/widget/ButtonWidget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isPasswordVisible = false;

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
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
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
                _buildFormField(
                  context,
                  label: 'メールアドレス',
                  color: Color(0xFF54BD6B),
                  controller: emailController,
                ),
                _buildFormField(
                  context,
                  label: 'パスワード',
                  color: Color(0xFF54BD6B),
                  obscureText: !_isPasswordVisible,
                  controller: passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF54BD6B),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ButtonWidget(
                    buttonText: 'ログイン',
                    buttonColor: const Color(0xFF54BD6B),
                    onPress: () async {
                      final result = await authNotifier.lgoinUser(
                        emailController.text,
                        passwordController.text,
                      );

                      if (result == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('ログインに失敗しました')),
                        );
                      } else if (result.status !=
                          FirebaseAuthResultStatus.Successful) {
                        final errorMessage =
                            FirebaseAuthExceptionHandler.exceptionMessage(
                                result.status);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage)),
                        );
                      } else {
                        userInfoNotifier.setUserInfo(result.user!.user!.uid);
                        context.push('/home');
                      }
                    },
                  ),
                ),
                const SizedBox(height: 40),
                _buildRichText(context, 'アカウントの作成は', '/signup'),
                const SizedBox(height: 10),
                _buildRichText(context, 'パスワードを忘れた場合は', '/forgotPassword'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
    BuildContext context, {
    required String label,
    required Color color,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
          ),
        ),
      ],
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
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'こちら',
            style: const TextStyle(
              color: Color(0xFFC93429),
              decoration: TextDecoration.underline,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.push(route),
          ),
        ],
      ),
    );
  }
}
