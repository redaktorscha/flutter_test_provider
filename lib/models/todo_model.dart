import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});
}

class TodoModel extends StateNotifier<List<Todo>> {
  TodoModel()
      : super([
          Todo(id: '0', title: 'Walk dog'),
          Todo(id: '1', title: 'Feed cat')
        ]);

  // Future<List<Todo>> _load() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   return [];
  // }

  // @override
  // Future<List<Todo>> build() async {
  //   // Load initial todo list from the remote repository
  //   return await _load();
  // }

  void add(Todo todo) {
    state = [...state, todo];
  }

  void toggleStatus(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            title: todo.title,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  void delete(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider =
    StateNotifierProvider<TodoModel, List<Todo>>((ref) => TodoModel());
