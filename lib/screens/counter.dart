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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const IncrementButton(),
            const CounterView(),
            const DecrementButton(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Home'))
          ],
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
