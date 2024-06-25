import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/router/router.dart';
import 'package:mobile/widget/TermsOfServiceDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

final cameraProvider = StateProvider<CameraDescription?>((ref) => null);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 利用可能なカメラのリストを取得
  final List<CameraDescription> cameras = await availableCameras();
  final prefs = await SharedPreferences.getInstance();
  final bool termsAccepted = prefs.getBool('terms_accepted') ?? false;
  if (!termsAccepted) {
    runApp(
      ProviderScope(
        overrides: [
          cameraProvider.overrideWithValue(
              StateController(cameras.isNotEmpty ? cameras.first : null)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              // 初回起動時にダイアログを表示
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  barrierDismissible: false, // ユーザーがダイアログ外をタップしても閉じないようにする
                  builder: (BuildContext context) {
                    return TermsOfServiceDialog();
                  },
                );
              });
              return const MyApp();
            },
          ),
        ),
      ),
    );
  } else {
    runApp(
      ProviderScope(
        overrides: [
          cameraProvider.overrideWithValue(
              StateController(cameras.isNotEmpty ? cameras.first : null)),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = CustomRouter(ref);
    return MaterialApp.router(
      title: 'アプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFFCF1D4), // 背景色を設定
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
