import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/notifier/user_scores_notifer.dart';

import 'package:mobile/widget/ButtonWidget.dart';
import 'package:mobile/widget/TitleWidget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool showButton = true; // Flag to manage button display
  String? _selectedValue = '1人'; // Initial value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (showButton) _buildInitialView(),
              if (!showButton) _buildGameOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitialView() {
    final scoresNotifier = ref.watch(userScoresNotiferProvider.notifier);

    return Column(
      children: [
        Container(height: 200),
        Image.asset(
          'assets/title_images/big_title.png',
          width: 300,
        ),
        Image.asset(
          'assets/title_images/small_title.png',
          width: 600,
        ),
        SizedBox(
          width: 250, // Set the width of the button
          child: ElevatedButton(
            onPressed: () {
              scoresNotifier.resetScores();
              setState(() {
                showButton = false; // Hide button and show the selection box
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54BD6B),
                padding: const EdgeInsets.symmetric(
                    vertical: 18), // Vertical padding
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30) // Rounded corners for aesthetics
                    )),
            child: const Text(
              "スタート",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGameOptions() {
    return Column(
      children: [
        Container(height: 180),
        const TitleWidget(),
        Container(height: 40),
        _buildDropdown(),
        Container(height: 180),
        _buildStartGameButton(),
      ],
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: _selectedValue,
        items: ['1人', '2人', '4,5人']
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ))
            .toList(),
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 200,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 3, color: Color(0xFF2D6486)),
            color: Colors.transparent,
          ),
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            border: Border(
              left: BorderSide(width: 3, color: Color(0xFF2D6486)),
              right: BorderSide(width: 3, color: Color(0xFF2D6486)),
              bottom: BorderSide(width: 3, color: Color(0xFF2D6486)),
            ),
            color: Colors.transparent,
          ),
          elevation: 0,
          scrollbarTheme: ScrollbarThemeData(radius: Radius.circular(40)),
        ),
        onChanged: (value) {
          setState(() {
            _selectedValue = value as String?;
          });
        },
      ),
    );
  }

  Widget _buildStartGameButton() {
    return SizedBox(
      width: 250, // Set the width of the button
      child: ElevatedButton(
        onPressed: () {
          context.go('/home/question1');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF54BD6B),
            padding:
                const EdgeInsets.symmetric(vertical: 18), // Vertical padding
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30) // Rounded corners for aesthetics
                )),
        child: const Text(
          "スタート",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
