import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

void main() {
   // Добавление ProviderScope позволяет использовать Riverpod для всего проекта
   const ProviderScope(child: App()),
}

final countProvider = StateProvider<int>((ref) => 0);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(
          create: (context) => CounterModel(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Provider Counter Demo'),
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
      ),
    );
  }
}

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var counter = Provider.of<CounterModel>(context);
    final count = ref.watch(countProvider);
    print(count);

    return Text(
      '$count',
      style: const TextStyle(color: Colors.green),
    );
  }
}

class IncrementButton extends ConsumerWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В этом случае нет необходимости прослушивать изменения, поэтому мы устанавливаем значение false в listen.
    // var counter = Provider.of<CounterModel>(context, listen: false);
    var counter = context.read<CounterModel>();

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
    // var counter = Provider.of<CounterModel>(context, listen: false);
    final count = ref.read(countProvider);

    return IconButton(
      icon: const Icon(Icons.remove, size: 12),
      onPressed: () {
        // Это вызовет изменение состояния, в результате чего прослушивающие виджеты будут перестроены
        count.state += 1;
      },
    );
  }
}
