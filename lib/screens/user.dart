import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    // print(user.name);
    var text = user.name == '' ? 'No username' : 'User: ${user.name}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('User screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Home'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await ref.read(userProvider.notifier).fetchUser();
          },
          child: const Icon(Icons.download)),
    );
  }
}
