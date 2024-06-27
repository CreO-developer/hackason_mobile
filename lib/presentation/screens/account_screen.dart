import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        backgroundColor: const Color(0xFFFCF1D4),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _toggleLogoutModal,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          userInfoState!.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: _toggleDeleteModal,
                      icon: const Icon(Icons.more_horiz),
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: 480 / 640,
                  ),
                  itemCount: userInfoState?.posts.length ?? 0,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future: getImageUrl(userInfoState?.posts[index].imgUrl ?? ''),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(child: Icon(Icons.error));
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
                              padding: EdgeInsets.zero,
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
              onButtonPressed: () async {
                _toggleDeleteModal();
                await userInfoNotifier.deleteUserInfo(authState?.uid);
                await authNotifier.deleteUser();
              },
            ),
          if (_isLogoutModalVisible)
            CustomModal(
              message: 'ログアウトしますか？',
              buttonText: 'ログアウト',
              onClose: _toggleLogoutModal,
              onButtonPressed: () async {
                _toggleLogoutModal();
                await authNotifier.logoutUser();
              },
            ),
        ],
      ),
    );
  }
}
