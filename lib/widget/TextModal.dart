import 'package:flutter/material.dart';

class TextCustomModal extends StatelessWidget {
  final String message;

  const TextCustomModal({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xE5FCF1D4), // Semi-transparent background color
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20), // Uniform padding for the inner container
          decoration: BoxDecoration(
            color: Color(
                0xFF54BD6B), // Background color for the message container // Rounded corners for the message container
          ),
          width: double.infinity,
          height: 150,
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center, // Center align the text
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ),
    );
  }
}
