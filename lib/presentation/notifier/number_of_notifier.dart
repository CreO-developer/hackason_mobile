import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedValueNotifier extends StateNotifier<String?> {
  SelectedValueNotifier() : super('1人');

  void updateSelectedValue(String? newValue) {
    state = newValue;
  }
}

final selectedValueProvider =
    StateNotifierProvider<SelectedValueNotifier, String?>((ref) {
  return SelectedValueNotifier();
});
