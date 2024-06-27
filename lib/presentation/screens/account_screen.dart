import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';
import 'package:mobile/presentation/screens/post_screen.dart';
import 'package:mobile/utils/get_image_url.dart';
import 'package:mobile/widget/ModalWidget.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends ConsumerState<AccountScreen> {
  bool _isDeleteModalVisible = false;
  bool _isLogoutModalVisible = false;

  void _toggleDeleteModal() {
    setState(() {
      _isDeleteModalVisible = !_isDeleteModalVisible;
    });
  }
  void _toggleLogoutModal() {
    setState(() {
      _isLogoutModalVisible = !_isLogoutModalVisible;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ここで依存関係にアクセスします
    final authState = ref.watch(authNotifierProvider);
    final userInfoNotifier = ref.read(userInfoNotifierProvider.notifier);
    userInfoNotifier.setUserInfo(authState!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    final userInfoNotifier = ref.watch(userInfoNotifierProvider.notifier);
    final userInfoState = ref.watch(userInfoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'プロフィール',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFFCF1D4),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _toggleLogoutModal,
          ),
        ],
      ),
      body: Stack(children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        userInfoState!.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: _toggleDeleteModal, icon: Icon(Icons.more_horiz))
                ],
              ),
            ),
            // ここをコメントアウトすると、画像を表示します。
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3列に設定
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: (480 / 640),
                ),
                itemCount: userInfoState?.posts.length ?? 0,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future:
                        getImageUrl(userInfoState?.posts[index].imgUrl ?? ''),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Icon(Icons.error));
                      } else {
                        final imageUrl = snapshot.data as String;
                        return GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  post: userInfoState?.posts[index],
                                  uid: authState?.uid,
                                  index: index,
                                  imageUrl: imageUrl,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: Image.network(imageUrl),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
        if (_isDeleteModalVisible)
          CustomModal(
            message: 'アカウントを削除しますか？',
            buttonText: '削除',
            onClose: _toggleDeleteModal,
            onButtonPressed: () {
              _toggleDeleteModal();
              userInfoNotifier.deleteUserInfo(authState?.uid);
              authNotifier.deleteUser();
              // context.push('/account');
            },
          ),
        if (_isLogoutModalVisible)
          CustomModal(
            message: 'ログアウトしますか？',
            buttonText: 'ログアウト',
            onClose: _toggleLogoutModal,
            onButtonPressed: () {
              _toggleLogoutModal();
              userInfoNotifier.deleteUserInfo(authState?.uid);
              authNotifier.deleteUser();
              // context.push('/account');
            },
          ),
      ]),
    );
  }
}
