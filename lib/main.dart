// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:mobile/screens/take_photo_screen.dart';
// import 'firebase_options.dart';

// Future<void> main() async {
//   // main 関数内で非同期処理を呼び出すための設定
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // デバイスで使用可能なカメラのリストを取得
//   final cameras = await availableCameras();

//   // 利用可能なカメラのリストから特定のカメラを取得
//   final firstCamera = cameras.first;

//   runApp(MyApp(camera: firstCamera));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key? key,
//     required this.camera,
//   }) : super(key: key);

//   final CameraDescription camera;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Camera Example',
//       theme: ThemeData(),
//       home: TakePhotoScreen(camera: camera),
//     );
//   }
// }
import 'package:camera/camera.dart';
import 'package:mobile/provider/score_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:mobile/router/router.dart';

final cameraProvider = StateProvider<CameraDescription?>((ref) => null);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 利用可能なカメラのリストを取得
  final List<CameraDescription> cameras = await availableCameras();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}


// // MyAppクラスの定義
// class MyApp extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final scores = ref.watch(scoresStateNotifierProvider);
//     return MaterialApp(
//       title: 'Flutter サンプルアプリ',
//       theme: ThemeData(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('api'),
//         ),
//         body: Center(
//           child: scores != null
//               ? Text(
//                   'Scores: ${scores.includeScore}, ${scores.originalScore}, ${scores.includeScore}')
//               : ElevatedButton(
//                   onPressed: () => ref
//                       .read(scoresStateNotifierProvider.notifier)
//                       .submitString("fheihafheihfaiehfaihf.jpeg"),
//                   child: Text('Fetch Scores'),
//                 ),
//         ),
//       ),
//     );
//   }
// }
