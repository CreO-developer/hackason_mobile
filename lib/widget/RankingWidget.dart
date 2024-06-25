import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/ranking_notifier.dart';
import 'package:mobile/presentation/notifier/report_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/presentation/screens/post_screen.dart';
import 'package:mobile/utils/get_image_url.dart';
import 'package:mobile/widget/ModalWidget.dart';

class RankingWidget extends ConsumerStatefulWidget {
  const RankingWidget({super.key, required this.posts});

  final List<Post> posts;

  @override
  RankingWidgetState createState() => RankingWidgetState();
}

class RankingWidgetState extends ConsumerState<RankingWidget> {
  bool _isBlockModalVisible = false;
  bool _isReportModalVisible = false;
  String target_uid = '';

  @override
  void initState() {
    super.initState();
  }

  void _toggleBlockModal() {
    setState(() {
      _isBlockModalVisible = !_isBlockModalVisible;
    });
  }

  void _toggleReportModal() {
    setState(() {
      _isReportModalVisible = !_isReportModalVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    final userInfoState = ref.watch(userInfoNotifierProvider);
    final rankingNotifier = ref.read(rankingNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    final reportNotifier = ref.read(reportNotifierProvider.notifier);

    return Stack(children: [
      Container(
        child: widget.posts.isEmpty
            ? Center(
                child: Text("現在表示できるものはありません"),
              )
            : ListView.builder(
                itemCount: widget.posts.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: getImageUrl(widget.posts[index].imgUrl),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Icon(Icons.error),
                        );
                      } else {
                        final imageUrl = snapshot.data as String;
                        print(imageUrl);
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostScreen(
                                    post: widget.posts[0],
                                    imageUrl: imageUrl,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(
                                        4, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(10.0), // 角を丸くする
                                    child: Image.network(
                                      imageUrl, // ここにiPhoneで撮った写真のURLを指定します
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        // ローカルアセットの画像をフォールバックとして使用
                                        return Image.asset(
                                          'assets/icon/NG.png', // ローカルのプレースホルダー画像へのパス
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  if (index == 0)
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: SvgPicture.asset(
                                        'assets/medal_images/gold_medal.svg', // SVGアイコンのパスを指定
                                        width: 70,
                                        height: 70,
                                      ),
                                    )
                                  else if (index == 1)
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: SvgPicture.asset(
                                        'assets/medal_images/silver_medal.svg', // SVGアイコンのパスを指定
                                        width: 70,
                                        height: 70,
                                      ),
                                    )
                                  else if (index == 2)
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: SvgPicture.asset(
                                        'assets/medal_images/bronze_medal.svg', // SVGアイコンのパスを指定
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  Positioned(
                                    top: 10,
                                    right: 40,
                                    child: IconButton(
                                      icon: const Icon(Icons.report),
                                      onPressed: () {
                                        _toggleReportModal();
                                        setState(() {
                                          target_uid = widget.posts[index].uid;
                                        });
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      icon: const Icon(Icons.block),
                                      onPressed: () {
                                        _toggleBlockModal();
                                        setState(() {
                                          target_uid = widget.posts[index].uid;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }
                    },
                  );
                  // return Container(
                  //   child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => PostScreen(post: widget.posts[0]),
                  //           ),
                  //         );
                  //       },
                  //       child: Container(
                  //         margin: EdgeInsets.all(30),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.black.withOpacity(0.25),
                  //               spreadRadius: 0,
                  //               blurRadius: 2,
                  //               offset: Offset(4, 5), // changes position of shadow
                  //             ),
                  //           ],
                  //         ),
                  //         child: Stack(
                  //           children: [
                  //             ClipRRect(
                  //               borderRadius: BorderRadius.circular(10.0), // 角を丸くする
                  //               child: Image.network(
                  //                 'https://via.placeholder.com/480x640', // ここにiPhoneで撮った写真のURLを指定します
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             if (index == 0)
                  //               Positioned(
                  //                 top: 10,
                  //                 left: 10,
                  //                 child: SvgPicture.asset(
                  //                   'assets/medal_images/gold_medal.svg', // SVGアイコンのパスを指定
                  //                   width: 70,
                  //                   height: 70,
                  //                 ),
                  //               )
                  //             else if (index == 1)
                  //               Positioned(
                  //                 top: 10,
                  //                 left: 10,
                  //                 child: SvgPicture.asset(
                  //                   'assets/medal_images/silver_medal.svg', // SVGアイコンのパスを指定
                  //                   width: 70,
                  //                   height: 70,
                  //                 ),
                  //               )
                  //             else if (index == 2)
                  //               Positioned(
                  //                 top: 10,
                  //                 left: 10,
                  //                 child: SvgPicture.asset(
                  //                   'assets/medal_images/bronze_medal.svg', // SVGアイコンのパスを指定
                  //                   width: 70,
                  //                   height: 70,
                  //                 ),
                  //               ),
                  //             Positioned(
                  //               top: 10,
                  //               right: 40,
                  //               child: IconButton(
                  //                 icon: const Icon(Icons.report),
                  //                 onPressed: () {
                  //                   _toggleReportModal();
                  //                   setState(() {
                  //                     target_uid = widget.posts[index].uid;
                  //                   });
                  //                 },
                  //               ),
                  //             ),
                  //             Positioned(
                  //               top: 10,
                  //               right: 10,
                  //               child: IconButton(
                  //                 icon: const Icon(Icons.block),
                  //                 onPressed: () {
                  //                   _toggleBlockModal();
                  //                   setState(() {
                  //                     target_uid = widget.posts[index].uid;
                  //                   });
                  //                 },
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )),
                  // );
                },
              ),
      ),
      if (_isBlockModalVisible)
        CustomModal(
          message: 'ブロックしますか？',
          buttonText: 'ブロック',
          onClose: _toggleBlockModal,
          onButtonPressed: () async {
            _toggleBlockModal();
            if (authState != null) {
              await userInfoNotifier.addBlock(authState!.uid, target_uid);
              await rankingNotifier.setRanking(
                  userInfoState!.blocks, target_uid);
            }
            // context.push('/account');
          },
        ),
      if (_isReportModalVisible)
        CustomModal(
          message: '通報しますか？',
          buttonText: '通報',
          onClose: _toggleReportModal,
          onButtonPressed: () async {
            _toggleReportModal();
            await reportNotifier.addReport(target_uid);
          },
        ),
    ]);
  }
}
