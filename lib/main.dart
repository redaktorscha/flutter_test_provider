import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Добавление ProviderScope позволяет использовать Riverpod для всего проекта
  runApp(const ProviderScope(child: App()));
}

class CounterModel extends StateNotifier<int> {
  CounterModel() : super(0);

  void increment() {
    state += 1;
  }

  void decrement() {
    state -= 1;
  }
}

final countProvider =
    StateNotifierProvider<CounterModel, int>((ref) => CounterModel());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Demo Riverpod'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IncrementButton(),
              DecrementButton(),
              CounterView(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(countProvider);
        print(count);

        return Text(
          '$count',
          style: const TextStyle(color: Colors.purple),
        );
      },
    );
  }
}

class IncrementButton extends ConsumerWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(countProvider.notifier);

    return IconButton(
      icon: const Icon(Icons.add, size: 12),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class DecrementButton extends ConsumerWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(countProvider.notifier);

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        // Это вызовет изменение состояния, в результате чего прослушивающие виджеты будут перестроены
        counter.decrement();
      },
    );
  }
}
