// import 'package:fl_test2/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/home.dart';
// import './models/user_model.dart';

void main() async {
  // Добавление ProviderScope позволяет использовать Riverpod для всего проекта
  runApp(const ProviderScope(child: App()));

  // как доступиться к стейту вне дерева виджетов
  // final container = ProviderContainer();

  // await container.read(userProvider.notifier).fetchUser();
  // runApp(UncontrolledProviderScope(container: container, child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Provider demo',
      home: HomeScreen(),
    );
  }
}
