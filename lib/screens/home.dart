import 'package:flutter/material.dart';
import 'counter.dart';
import 'user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home screen'),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CounterScreen()));
                },
                child: const Text('Go to Counter Screen')),
            ElevatedButton(onPressed: () {
               Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const UserScreen()));
            }, child: const Text('Go to User Screen')),
          ],
        )));
  }
}
