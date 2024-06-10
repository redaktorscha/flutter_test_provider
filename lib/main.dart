// import 'package:fl_test2/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/home.dart';
// import './models/user_model.dart';

// final userProvider = Provider((ref) => User('john wick'));

void main() {
  // можно доступиться до стейта вне дерева виджетов, чтобы что-то отлогировать
  // final container = ProviderContainer();
  // final user = container.read(userProvider);
  // print('name: ${user.name}');

  // проинициализировать стейт перед запуском приложения вне дерева виджетов
  // final container = ProviderContainer();

  // await container.read(userProvider.notifier).fetchUser();
  // runApp(UncontrolledProviderScope(container: container, child: const App()));

  // Добавление ProviderScope позволяет использовать Riverpod для всего проекта
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Riverpod demo',
      home: HomeScreen(),
    );
  }
}
