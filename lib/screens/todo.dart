import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_model.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('TodoList example')),
      body: Center(
          child: Column(
        children: [
          ListView(
            children: todos.map((e) => TodoItem(todo: e)).toList(),
          ),
        ],
      )),
    );
  }
}

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        title: Text(todo.title),
        leading: Checkbox(
          value: todo.completed,
          onChanged: (val) {
            ref.read(todoProvider.notifier).toggleStatus(todo.id);
          },
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            ref.read(todoProvider.notifier).delete(todo.id);
          },
        ));
  }
}

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormState();
}

class _FormState extends State<FormView> {
  String _value = '';

  void updateValue(newValue) {
    print(newValue);
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            onChanged: (content) {
              updateValue(content);
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Create Todo',
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Consumer(builder: (context, ref, child) {
          return ElevatedButton(
              onPressed: () {
                final todos = ref.watch(todoProvider);
                final newTodo =
                    Todo(id: todos.length.toString(), title: _value);
                ref.read(todoProvider.notifier).add(newTodo);
              },
              child: const Icon(Icons.add));
        })
      ],
    );
  }
}
