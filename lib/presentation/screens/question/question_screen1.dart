import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/single.dart';
import 'package:mobile/main.dart';
import 'package:mobile/presentation/notifier/number_of_notifier.dart';
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
    final selectedValue = ref.watch(selectedValueProvider);
    String filter;
    String theme;
    Map<String, String> questionAndFilter = {};
    if (selectedValue == "1人")
      switch (scoresNotifier.state.length) {
        case 0:
          questionAndFilter = QuestionConstants.getRandomQuestion1(1, 5);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
        case 1:
          questionAndFilter = QuestionConstants.getRandomQuestion2(1, 5);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
        case 2:
          questionAndFilter = QuestionConstants.getRandomQuestion3(1, 5);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
        default:
          questionAndFilter = QuestionConstants.getRandomQuestion4(1, 5);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
      }
    else {
      print("2人");
      switch (scoresNotifier.state.length) {
        case 0:
          questionAndFilter = QuestionConstants.getRandomQuestion1(6, 10);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
        case 1:
          questionAndFilter = QuestionConstants.getRandomQuestion2(6, 10);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
        case 2:
          questionAndFilter = QuestionConstants.getRandomQuestion3(6, 10);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
        default:
          questionAndFilter = QuestionConstants.getRandomQuestion4(6, 10);
          theme = questionAndFilter['theme']!;
          filter = questionAndFilter['filter']!;
          break;
      }
    }

    Future<void> upload(String imagePath) async {
      if (!mounted) return;
      FirebaseStorage storage = FirebaseStorage.instance;
      var uuid = Uuid();
      if (imagePath != null) {
        final uid = uuid.v4();
        final imageFile = File(imagePath);
        print("Uploading image: $imagePath");
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
          return;
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
