import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;

  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
  }) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool showButton = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showButton
          ? ElevatedButton(
              onPressed: () {
                setState(() {
                  showButton = false; // ボタンを非表示にし、選択ボックスを表示
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.buttonColor, // 引数で渡された色を設定
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 30), // ボタンのサイズ
              ),
              child: Text(widget.buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  )), // テキストを太字に設定
            )
          : Container(), // ボタンが非表示のときに表示するウィジェットを指定
    );
  }
}
