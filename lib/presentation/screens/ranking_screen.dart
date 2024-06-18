import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ランキング画面'),
      ),
      body: Center(
        child: const Text('こちらはランキング画面です'),
      ),
    );
  }
}
