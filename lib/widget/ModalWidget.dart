import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final String message;
  final String buttonText;
  final bool showCheckbox;
  final VoidCallback onClose;
  final VoidCallback onButtonPressed;

  const CustomModal({
    Key? key,
    required this.message,
    required this.buttonText,
    this.showCheckbox = false,
    required this.onClose,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xE5FCF1D4), // 背景色（透明度90%）
      child: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          color: Color(0xFF54BD6B),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: onClose,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            message,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    if (showCheckbox) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.white, // チェックボックスの色を白に設定
                            checkColor: Color(0xFF54BD6B), // チェックの色を緑に設定
                          ),
                          Expanded(
                            child: Text(
                              '今後このメッセージを表示しない',
                              style: TextStyle(color: Colors.white),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFD9595), // 背景色
                        foregroundColor: Colors.white, // 文字色
                        side: BorderSide(color: Colors.white), // ボーダーの色
                      ),
                      onPressed: onButtonPressed,
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
