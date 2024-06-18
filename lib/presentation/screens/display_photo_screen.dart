import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DisplayPhotoScreen extends StatelessWidget {
  const DisplayPhotoScreen({Key? key, required this.imagePath})
      : super(key: key);

  final List<String> imagePath;

  Future<void> upload(imagePath) async {
    // 画像を取得できた場合一枚目をFirebaseStorageにアップロードする
    FirebaseStorage storage = FirebaseStorage.instance;
    if (imagePath != null) {
      final imageFile = File(imagePath[0]);
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
        children: [Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2列で表示
              crossAxisSpacing: 10.0, // グリッド間の横スペース
              mainAxisSpacing: 10.0, // グリッド間の縦スペース
            ),
            itemCount: imagePath.length,
            itemBuilder: (context, index) {
              String path = imagePath[index];
              return GridTile(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(child: Image.file(File(path))),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
                  child: FloatingActionButton(
                    onPressed: () async {
                      await upload(imagePath); // ここで画像のアップロード処理を行う関数を呼び出す
                    },
                    child: const Icon(Icons.upload),
                  ),
                ),
        ]
      ),
    );
  }
}
