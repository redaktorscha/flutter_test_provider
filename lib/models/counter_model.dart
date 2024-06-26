import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterModel extends StateNotifier<int> {
  CounterModel() : super(0);

  void increment() {
    state += 1;
  }

  void decrement() {
    state -= 1;
  }
}

final countProvider1 =
    StateNotifierProvider<CounterModel, int>((ref) => CounterModel());

final countProvider2 =
    StateNotifierProvider<CounterModel, int>((ref) => CounterModel());
