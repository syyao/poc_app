import 'package:flutter/material.dart';
import 'package:poc_app/provider/counter_provider.dart';
import 'package:poc_app/screen/lock_page.dart';
import 'package:poc_app/widget/lestener_widget.dart';
import 'package:provider/provider.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return ListenerWidget(
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
      ),
    );
  }
}
