import 'package:flutter/material.dart';
import 'package:poc_app/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Counter counter;
  startTimer() {
    counter.startTimer(context);
  }

  @override
  void initState() {
    counter = context.read<Counter>();
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: counter.incrementDown,
      onPointerMove: counter.updateLocation,
      onPointerUp: counter.incrementUp,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider example'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                Text('You have pushed the button this many times:'),
                Text(
                  // Calls `context.watch` to make [Count] rebuild when
                  // [Counter] changes.
                  '${context.watch<Counter>().count}',
                  key: const Key('counterState'),
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('increment_floatingActionButton'),

          // Calls `context.read` instead of `context.watch` so
          // that it does not rebuild when [Counter] changes.
          onPressed: () => context.read<Counter>().increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
