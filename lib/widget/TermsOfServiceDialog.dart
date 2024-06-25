import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsOfServiceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('利用規約'),
      content: SingleChildScrollView(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                  text:
                      '本アプリケーション（以下、「本アプリ」といいます）をご利用いただく前に、以下の利用規約をよくお読みください。\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '1. 著作権\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'ユーザーが本アプリに投稿する写真の著作権は、投稿者本人に帰属します。ただし、ユーザーは本アプリに写真を投稿することにより、当社に対し、非独占的な利用権を無償で付与するものとします。\n'),
              TextSpan(
                  text: '2. ユーザーの責任\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'ユーザーは、投稿する写真について、著作権、肖像権、プライバシー権を侵害しないように注意してください。\n'),
              TextSpan(
                  text: '3. 免責事項\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '本アプリは、ユーザーが投稿した内容について一切の責任を負わないものとします。\n'),
              TextSpan(
                  text: '4. 同意事項\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '本規約に同意の上でないと、本アプリの写真投稿機能を利用することはできません。\n'),
              TextSpan(
                  text: '5. 退会とアカウント削除\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: 'ユーザーはいつでも退会し、自身のアカウントを削除することができます。\n'),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('同意する'),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('terms_accepted', true);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
