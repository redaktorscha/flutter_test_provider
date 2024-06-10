import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String id;
  final String title;
  bool completed;

  Todo({required this.id, required this.title, this.completed = false});
}

class TodoModel extends StateNotifier<List<Todo>> {
  TodoModel() : super([]);

  void load(List<Todo> todos) {
    state = todos;
  }

  add(Todo todo) {
    state = [...state, todo];
  }

  update(String id, bool completed) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            title: todo.title,
            completed: completed,
          )
        else
          todo,
    ];
  }

  delete(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  final todoProvider =
      StateNotifierProvider<TodoModel, List<Todo>>((ref) => TodoModel());
}
