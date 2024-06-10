import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IncrementButton(provider: countProvider1),
              CounterView(provider: countProvider1),
              DecrementButton(provider: countProvider1),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IncrementButton(provider: countProvider2),
              CounterView(provider: countProvider2),
              DecrementButton(provider: countProvider2),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Home'))
        ],
      )),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key, required this.provider});
  final StateNotifierProvider<CounterModel, int> provider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(provider);
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
  const IncrementButton({super.key, required this.provider});
  final StateNotifierProvider<CounterModel, int> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(provider.notifier);

    return IconButton(
      icon: const Icon(Icons.add, size: 12),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class DecrementButton extends ConsumerWidget {
  const DecrementButton({super.key, required this.provider});
  final StateNotifierProvider<CounterModel, int> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(provider.notifier);

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        // Это вызовет изменение состояния, в результате чего прослушивающие виджеты будут перестроены
        counter.decrement();
      },
    );
  }
}
