import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/firebase_auth_error.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/widget/ButtonWidget.dart';


class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends ConsumerState<SignUpPage> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController nameController = TextEditingController();

  bool _isPasswordVisible = false; // State for password visibility

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                '新規登録',
                style: TextStyle(color: Color(0xFF2D6486), fontSize: 24),
              ),
              const SizedBox(height: 20),
              _buildFormField(
                context,
                label: 'ニックネーム',
                color: Color(0xFF54BD6B),
                controller: nameController,
                onChanged: (value) => userInfoNotifier.setName(value),
              ),
              _buildFormField(
                context,
                label: 'メールアドレス',
                color: Color(0xFF54BD6B),
                controller: emailController,
                onChanged: (value) => userInfoNotifier.setEmail(value),
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
              const SizedBox(height: 20),
              Center(
                child: ButtonWidget(
                  buttonText: 'ユーザ登録',
                  buttonColor: const Color(0xFF54BD6B),
                  onPress: () async {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ニックネームを入力してください。'),
                        ),
                      );
                      return;
                    }

                    final result = await authNotifier.registerUser(
                      emailController.text,
                      passwordController.text,
                    );

                    if (result == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ユーザ登録に失敗しました。'),
                        ),
                      );
                      return;
                    } else if (result.status != FirebaseAuthResultStatus.Successful) {
                      final errorMessage =
                          FirebaseAuthExceptionHandler.exceptionMessage(result.status);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(errorMessage)),
                      );
                    } else {
                      await userInfoNotifier.createUserInfo(result.user!.user!.uid);
                      await userInfoNotifier.setUserInfo(result.user!.user!.uid);
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "既にアカウントをお持ちの方は",
                      style: TextStyle(
                        color: Color(0xFFC93429),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "こちら",
                      style: const TextStyle(
                        color: Color(0xFFC93429),
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push('/login');
                        },
                    ),
                  ],
                ),
              ),
            ],
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
}