import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/single.dart';
import 'package:mobile/main.dart';
import 'package:mobile/presentation/notifier/user_scores_notifer.dart';
import 'package:mobile/presentation/screens/question/question_screen2.dart';
import 'package:mobile/widget/CameraPreviewWidget.dart';
import 'package:uuid/uuid.dart';

class QuestionScreen1 extends ConsumerStatefulWidget {
  const QuestionScreen1({Key? key}) : super(key: key);

  @override
  _QuestionScreen1State createState() => _QuestionScreen1State();
}

class _QuestionScreen1State extends ConsumerState<QuestionScreen1> {
  //画面遷移用の関数

  @override
  Widget build(BuildContext context) {
    final CameraDescription? camera = ref.watch(cameraProvider);
    final scoresNotifier = ref.read(userScoresNotiferProvider.notifier);
    String filter;
    String theme;

    switch (scoresNotifier.state.length) {
      case 0:
        filter = QuestionConstants.getRandomQuestion1()['filter']!;
        theme = QuestionConstants.getRandomQuestion1()['theme']!;
        break;
      case 1:
        filter = QuestionConstants.getRandomQuestion2()['filter']!;
        theme = QuestionConstants.getRandomQuestion2()['theme']!;
        break;
      case 2:
        filter = QuestionConstants.getRandomQuestion3()['filter']!;
        theme = QuestionConstants.getRandomQuestion3()['theme']!;
        break;
      default:
        filter = QuestionConstants.getRandomQuestion4()['filter']!;
        theme = QuestionConstants.getRandomQuestion4()['theme']!;
        break;
    }

    Future<void> upload(String imagePath) async {
      if (!mounted) return;
      FirebaseStorage storage = FirebaseStorage.instance;
      var uuid = Uuid();
      if (imagePath != null) {
        final uid = uuid.v4();
        final imageFile = File(imagePath);

        if (!imageFile.existsSync()) {
          print("File does not exist: $imagePath");
          return;
        }

        try {
          await storage.ref('$uid.jpeg').putFile(imageFile);
          final data = {
            'theme': theme,
            'filter': filter,
            'imgUrl': '$uid.jpeg'
          };
          await scoresNotifier.submitString(data);
          // if (mounted) {
          //   GoRouter.of(context).push(
          //       '/home/question2'); // Assuming '/question2' is the correct route
          // }

          // await Future.delayed(Duration(seconds: 2));
        } catch (e) {
          print("Error uploading image: $e");
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to upload image')));
          }
        }
      }
    }

    if (camera != null) {
      return Scaffold(
        body: CameraPreviewWidget(
            camera: camera,
            filter: filter,
            theme: theme,
            upload: (path) => upload(path),
            questionCount: scoresNotifier.state.length + 1),
      );
    } else {
      return const Scaffold(
        body: Center(child: Text('カメラが利用できません。')),
      );
    }
  }
}
