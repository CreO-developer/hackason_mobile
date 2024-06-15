import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DisplayPhotoScreen extends StatelessWidget {
  const DisplayPhotoScreen({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;

  Future<void> upload(imagePath) async {
    // 画像をスマホのギャラリーから取得
    // 画像を取得できた場合はFirebaseStorageにアップロードする
    FirebaseStorage storage = FirebaseStorage.instance;
    if (imagePath != null) {
      final imageFile = File(imagePath);
      try {
        await storage.ref('UL/upload-pic.jpeg').putFile(imageFile);
      } catch (e) {
        print(e);
      }
    }
    return;
  }


  // 読み取りたい場合は下記コメントアウトを外す
  // Future<Image> download() async { // 非同期処理で取得する
  //   final Reference ref = FirebaseStorage.instance.ref().child('UL/upload-pic.jpeg');
  //   String imageUrl = await ref.getDownloadURL();
  //   print(imageUrl);
  //   return Image.network(imageUrl);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('撮れた写真')),
      body: Column(
        children: [
          Center(child: Image.file(File(imagePath))),
          Container(
            child: FloatingActionButton(
              onPressed: () async {
                await upload(imagePath);
              },
              child: const Icon(Icons.upload),
            ),
          ),
          // FutureBuilder(
          //   future: download(),
          //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //     return snapshot.data ?? Container();
          //   },
          // )
        ],
      ),
    );
  }
}
