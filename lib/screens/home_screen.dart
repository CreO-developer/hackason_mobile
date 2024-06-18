import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/main.dart';
import 'package:mobile/widget/CameraPreviewWidget.dart';
import 'package:mobile/widget/TitleWidget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool showButton = true; // ボタンを表示するかどうかを管理するフラグ
  String? _selectedValue = '1人'; // Initial value set here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          // CameraPreviewWidget(camera: camera), // カメラプレビューウィジェットを表示
          Container(height: 200), // 20ピクセルのスペース
          if (showButton)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showButton = false; // ボタンを非表示にし、選択ボックスを表示
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54BD6B), // 背景色を緑に設定
                padding: const EdgeInsets.symmetric(
                    horizontal: 31, vertical: 28), // ボタンのサイズ
              ),
              child: const Text("GAME START→",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  )), // テキストを太字に設定
            ),

          if (!showButton) ...[
            const TitleWidget(),
            Container(height: 60), // 20ピクセルのスペース
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: _selectedValue,
                items: ['1人', '2人', '4,5人']
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ))
                    .toList(),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF2D6486),
                    ),
                    color: Colors.transparent, // 完全に透明な背景色
                  ),
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14), // 左下の角に丸みを追加
                      bottomRight: Radius.circular(14), // 右下の角に丸みを追加
                    ),
                    border: Border(
                      left:
                          BorderSide(width: 3, color: Color(0xFF2D6486)), // 左枠
                      right:
                          BorderSide(width: 3, color: Color(0xFF2D6486)), // 右枠
                      bottom:
                          BorderSide(width: 3, color: Color(0xFF2D6486)), // 下枠
                    ),
                    color: Colors.transparent, // ドロップダウンの背景色も完全に透明に
                  ),
                  elevation: 0, // ドロップダウンリストの影を無くす
                  // offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: Radius.circular(40),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value as String?;
                  });
                },
              ),
            )
          ]
        ]),
      ),
    );
  }
}

    // final CameraDescription? camera = ref.watch(cameraProvider);

    // if (camera == null) {
    //   return Scaffold(
    //     appBar: AppBar(title: const Text("No Camera")),
    //     body: const Center(child: Text("No camera available on this device")),
    //   );
    // }
    // カメラが利用可能な場合の UI
    // return Scaffold(
    //   appBar: AppBar(title: const Text("Camera")),
    //   body: CameraPreviewWidget(camera: camera), // この部分はカメラプレビューウィジェットを指す
    // );