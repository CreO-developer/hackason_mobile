import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/presentation/notifier/user_scores_notifer.dart';
import 'package:mobile/widget/ButtonWidget.dart';
import 'package:mobile/widget/Result_q3q4.dart';
import 'package:mobile/widget/Result_total.dart';
import 'package:mobile/widget/result_q1q2.dart';

final imageStateProvider = StateProvider<bool>((ref) => false);
final imageUrlProvider = StateProvider<String>((ref) => "");
final imgUrlProvider = StateProvider<String>((ref) => "");

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ResultScreenState createState() => ResultScreenState();
}
class ResultScreenState extends ConsumerState<ResultScreen> {
  // const ResultScreen({Key? key}) : super(key: key);

  Future<String> _fetchImageUrl(String imagePath) async {
    Reference ref = FirebaseStorage.instance.ref().child(imagePath);
    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }

  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userScoresNotifer = ref.watch(userScoresNotiferProvider);
    final pageController = PageController();
    final imageState = ref.watch(imageStateProvider);
    final imageUrl = ref.watch(imageUrlProvider);
    final imgUrl = ref.watch(imgUrlProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('リザルト'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFCF1D4),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450, // ここでPageViewの高さを指定
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: userScoresNotifer.length + 1,
                    itemBuilder: (_, index) {
                      if (index == 0) {
                        return SizedBox(
                          width: 330,
                          child: ResultTotalCardWidget(userScoreStates: userScoresNotifer),
                        );
                      } else if (index - 1 < userScoresNotifer.length) {
                        final score = userScoresNotifer[index - 1];
                        if (index - 1 == 0 || index - 1 == 1) {
                          return SizedBox(
                            width: 330,
                            child: ResultQ1Q2CardWidget(
                              userScoreState: score,
                            ),
                          );
                        } else {
                          return SizedBox(
                            width: 330,
                            child: ResultQ3Q4CardWidget(
                              userScoreState: score,
                            ),
                          );
                        }
                      } else {
                        return Container();
                      }
                    },
                  ),
                  if (imageState)
                    Container(
                      color: Colors.black.withOpacity(0.5),
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
                                  icon: const Icon(Icons.close,
                                      color: Colors.black, size: 30),
                                  onPressed: () {
                                    ref.read(imageStateProvider.notifier).state = false;
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
              AnimatedBuilder(
                animation: pageController,
                builder: (_, __) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        userScoresNotifer.length + 1,
                        (index) => buildIndicator(
                          index == (pageController.page ?? pageController.initialPage).round(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            if (imageState) const SizedBox(height: 35),
            const SizedBox(height: 30),
            SizedBox(
              width: 330,
              child: Row(
                mainAxisAlignment: _currentPage != 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                children: imageState
                    ? [
                        ButtonWidget(
                          buttonText: "広場に投稿する",
                          buttonColor: const Color(0xFFFD9595),
                          onPress: () async {
                            _showConfirmationDialog(context, ref);
                          },
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.refresh, size: 50, color: Color(0xFF5F6368)),
                      ]
                    : [
                      if (_currentPage != 0)
                        ButtonWidget(
                          buttonText: "撮影した画像を見る",
                          buttonColor: const Color(0xFF54BD6B),
                          onPress: () async {
                            if (pageController.page != null &&
                                pageController.page!.round() < userScoresNotifer.length + 1 && pageController.page!.round() > 0) {
                              final imageUrl = await _fetchImageUrl(
                                userScoresNotifer[pageController.page!.round() -1].imgUrl,
                              );
                              ref.read(imageUrlProvider.notifier).state = imageUrl;
                              ref.read(imageStateProvider.notifier).state = true;
                              ref.read(imgUrlProvider.notifier).state =
                                  userScoresNotifer[pageController.page!.round()-1].imgUrl;
                            }
                          },
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.refresh, size: 50, color: Color(0xFF5F6368)),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFFC93429) : Colors.grey,
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                color: const Color(0xFF54BD6B),
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
                            icon: const Icon(Icons.highlight_off,
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
                          backgroundColor: const Color(0xFFFD9595),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          '登録する',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          final uid = ref.watch(authNotifierProvider)?.uid;
                          await ref
                              .read(userScoresNotiferProvider.notifier)
                              .scorePost(ref.read(imgUrlProvider));
                          if (uid != null) {
                            await ref
                                .read(userInfoNotifierProvider.notifier)
                                .setUserInfo(uid);
                          }
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
