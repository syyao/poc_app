import 'package:flutter/material.dart';
import 'package:poc_app/provider/counter_provider.dart';
import 'package:poc_app/screen/lock_page.dart';
import 'package:poc_app/screen/next_page.dart';
import 'package:poc_app/widget/lestener_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
            textAlign: TextAlign.center,
          ),
          Text(
            // Calls `context.watch` to make [Count] rebuild when
            // [Counter] changes.
            '${context.watch<Counter>().count}',
            key: const Key('counterState'),
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),

        // Calls `context.read` instead of `context.watch` so
        // that it does not rebuild when [Counter] changes.
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NextPage();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
