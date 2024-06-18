import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 160,
      alignment: Alignment.center, // コンテナ全体の中央寄せ
      decoration: ShapeDecoration(
        color: const Color(0xFFC9342A),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allow children to draw outside of the box
        children: <Widget>[
          Positioned(
            bottom:
                -30, // Position the circle above the top edge of the container
            left:
                40, // Position the circle beyond the right edge of the container
            child: Container(
              width: 94,
              height: 78,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF2D6486),
              ),
            ),
          ),
          Positioned(
            bottom:
                -20, // Position the circle above the top edge of the container
            left:
                -30, // Position the circle beyond the right edge of the container
            child: Container(
              width: 153,
              height: 78,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFEAC845),
              ),
            ),
          ),
          Positioned(
            bottom:
                0, // Position the circle above the top edge of the container
            left:
                0, // Position the circle beyond the right edge of the container
            child: Container(
              width: 330,
              height: 160,
              alignment: Alignment.center, // コンテナ全体の中央寄せ
              decoration: ShapeDecoration(
                color: Color(0xFFC9342A),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '(タイトル)は、お題の図形を\n複数人で作るゲームです。\n\nプレイする人数を選択してください↓',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
            top: -30, // Position the circle above the top edge of the container
            right:
                10, // Position the circle beyond the right edge of the container
            child: Container(
              width: 115,
              height: 62,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFFD9595),
              ),
            ),
          ),
          Positioned(
            top: 20, // Position the circle above the top edge of the container
            right:
                -30, // Position the circle beyond the right edge of the container
            child: Container(
              width: 89,
              height: 47,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF54BD6B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
