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
              const IncrementButton1(),
              const CounterView1(),
              const DecrementButton1(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Home'))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const IncrementButton2(),
              const CounterView2(),
              const DecrementButton2(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Home'))
            ],
          ),
        ],
      )),
    );
  }
}

class CounterView1 extends StatelessWidget {
  const CounterView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(countProvider1);
        print(count);

        return Text(
          '$count',
          style: const TextStyle(color: Colors.purple),
        );
      },
    );
  }
}

class CounterView2 extends StatelessWidget {
  const CounterView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(countProvider2);
        print(count);

        return Text(
          '$count',
          style: const TextStyle(color: Colors.purple),
        );
      },
    );
  }
}

class IncrementButton1 extends ConsumerWidget {
  const IncrementButton1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(countProvider1.notifier);

    return IconButton(
      icon: const Icon(Icons.add, size: 12),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class IncrementButton2 extends ConsumerWidget {
  const IncrementButton2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(countProvider2.notifier);

    return IconButton(
      icon: const Icon(Icons.add, size: 12),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class DecrementButton1 extends ConsumerWidget {
  const DecrementButton1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(countProvider1.notifier);

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        // Это вызовет изменение состояния, в результате чего прослушивающие виджеты будут перестроены
        counter.decrement();
      },
    );
  }
}

class DecrementButton2 extends ConsumerWidget {
  const DecrementButton2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения
    final counter = ref.read(countProvider2.notifier);

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        // Это вызовет изменение состояния, в результате чего прослушивающие виджеты будут перестроены
        counter.decrement();
      },
    );
  }
}
