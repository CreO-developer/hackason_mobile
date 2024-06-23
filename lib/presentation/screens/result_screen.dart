import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/presentation/notifier/user_scores_notifer.dart';
import 'package:mobile/widget/ButtonWidget.dart';
import 'package:mobile/widget/Result_q3q4.dart';
import 'package:mobile/widget/StartWidget.dart';
import 'package:mobile/widget/result_q1q2.dart';

final imageStateProvider = StateProvider<bool>((ref) => false);
final imageUrlProvider = StateProvider<String>((ref) => "");
final imgUrlProvider = StateProvider<String>((ref) => "");

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

  Future<String> _fetchImageUrl(imagePath) async {
    // Replace 'path/to/your/image.jpg' with the actual path to your image in Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child(imagePath);
    String imageUrl = await ref.getDownloadURL();

    return imageUrl;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresNotifier = ref.watch(userScoresNotiferProvider);
    final pageController = PageController();

    final imageState = ref.watch(imageStateProvider);
    final imageUrl = ref.watch(imageUrlProvider);
    final imgUrl = ref.watch(imgUrlProvider);
    print(scoresNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('リザルト'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFCF1D4),
      ),
      body: Column(children: [
        SizedBox(
          height: 450, // ここでPageViewの高さを指定
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: scoresNotifier.length,
                itemBuilder: (_, index) {
                  final score = scoresNotifier[index];
                  return index == 0 || index == 1
                      ? SizedBox(
                          width: 330,
                          child: ResultQ1Q2CardWidget(
                            userScoreState: score,
                          ),
                        )
                      : SizedBox(
                          width: 330,
                          child: ResultQ3Q4CardWidget(
                            userScoreState: score,
                          ),
                        );
                },
              ),
              if (imageState)
                Container(
                  color: Colors.black.withOpacity(
                      0.5), // Optional: Add a semi-transparent overlay
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 450,
                          ),
                          Positioned(
                            top: 0,
                            right: 16,
                            child: IconButton(
                              icon: Icon(Icons.close,
                                  color: Colors.black, size: 30),
                              onPressed: () {
                                ref.read(imageStateProvider.notifier).state =
                                    false;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (!imageState)
          (AnimatedBuilder(
            animation: pageController,
            builder: (_, __) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    scoresNotifier.length,
                    (index) => buildIndicator(index ==
                        (pageController.page ?? pageController.initialPage)
                            .round()),
                  ),
                ),
              );
            },
          )),
        if (imageState) const SizedBox(height: 35),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageState
              ? [
                  ButtonWidget(
                    buttonText: "広場に投稿する",
                    buttonColor: Color(0xFFFD9595),
                    onPress: () async {
                      // モーダルを表示したい
                      _showConfirmationDialog(context, ref);
                    },
                  ),
                  SizedBox(width: 20), // Add
                  Icon(Icons.refresh, size: 50, color: Color(0xFF5F6368)),
                ]
              : [
                  ButtonWidget(
                    buttonText: "撮影した画像を見る",
                    buttonColor: Color(0xFF54BD6B),
                    onPress: () async {
                      final imageUrl = await _fetchImageUrl(
                          scoresNotifier[pageController.page!.round()].imgUrl);
                      ref.read(imageUrlProvider.notifier).state = imageUrl;
                      ref.read(imageStateProvider.notifier).state = true;
                      ref.read(imgUrlProvider.notifier).state =
                          scoresNotifier[pageController.page!.round()].imgUrl;
                    },
                  ),
                  SizedBox(width: 20), // Add
                  Icon(Icons.refresh, size: 50, color: Color(0xFF5F6368)),
                ],
        ),
      ]),
    );
  }

  Widget buildIndicator(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color(0xFFC93429) : Colors.grey,
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Set square corners
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints
                    .maxWidth, // Set the width of the dialog to be full screen
                color: Color(0xFF54BD6B), // Set the background color to green
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            '本当に登録しますか？',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          top: -10,
                          child: IconButton(
                            icon: Icon(Icons.highlight_off,
                                color: Colors.white, size: 30),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFFFD9595), // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          '登録する',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          ref
                              .read(userScoresNotiferProvider.notifier)
                              .scorePost(ref.read(imgUrlProvider));
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
