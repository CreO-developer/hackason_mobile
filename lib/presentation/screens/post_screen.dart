import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/widget/ModalWidget.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({
    super.key,
    this.post,
    this.uid,
    this.index,
    this.imageUrl,
  });

  final Post? post;
  final String? uid;
  final int? index;
  final String? imageUrl;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  bool _isModalVisible = false;

  void _toggleModal() {
    setState(() {
      _isModalVisible = !_isModalVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF1D4),
        title: widget.uid == null ? Text('ランキング − 総合') : Text(''),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          widget.imageUrl ??
                              'https://via.placeholder.com/480x640',
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (widget.uid != null)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(Icons.more_horiz),
                            iconSize: 40,
                            onPressed: _toggleModal,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.post!.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    if (widget.post?.filter.split('-')[0] == 'kumitaiso' ||
                        widget.post?.filter.split('-')[0] == 'comedian')
                      Row(children: [
                        Icon(
                          Icons.star,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF373A4D),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${widget.post!.scores.includeScore + widget.post!.scores.excludeScore + widget.post!.scores.peopleScore + widget.post!.scores.originalScore + (widget.post!.scores.faceScore ?? 0)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '/150点',
                              ),
                            ],
                          ),
                        ),
                      ])
                    else
                      Row(children: [
                        Icon(
                          Icons.star,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF373A4D),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${widget.post!.scores.includeScore + widget.post!.scores.excludeScore + widget.post!.scores.peopleScore + widget.post!.scores.originalScore + (widget.post!.scores.faceScore ?? 0)}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '/100点',
                              ),
                            ],
                          ),
                        ),
                      ]),
                    // Text(
                    //   'ここに日付追加したい',
                    //   style: TextStyle(fontSize: 16),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          if (_isModalVisible)
            CustomModal(
              message: '投稿を削除しますか？',
              buttonText: '削除',
              onClose: _toggleModal,
              onButtonPressed: () {
                _toggleModal();
                userInfoNotifier.resetPost(widget.uid, widget.index);
                context.push('/account');
              },
            ),
        ],
      ),
    );
  }
}
