import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;
  final Function() onPress;

  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPress,
  }) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            widget.onPress();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
            ), // 引数で渡された色を設定
          ),
          child: Text(widget.buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              )), // テキストを太字に設定
        ));
  }
}
