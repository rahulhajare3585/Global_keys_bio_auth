import 'package:flutter/material.dart';
import 'package:global_keys/util.dart';

class BasicKeyPage extends StatelessWidget {
  final keyCounter = GlobalKey<_CounterWidgetState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Global Keys'),
          centerTitle: true,
        ),
        body: Center(
          child: CounterWidget(key: keyCounter),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final counter = keyCounter.currentState!.counter;

            keyCounter.currentState!.increment();
            final newCounter = keyCounter.currentState!.counter;

            Utils.showSnackBar(context,
                text: 'Counter: $counter -> $newCounter');
          },
        ),
      );
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment() => setState(() => counter += 5);

  @override
  Widget build(BuildContext context) => Text(
        'Counter: $counter',
        style: TextStyle(fontSize: 32),
      );
}
