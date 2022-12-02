import 'package:flutter/material.dart';
import 'package:poc_app/provider/counter_provider.dart';
import 'package:poc_app/screen/lock_page.dart';
import 'package:poc_app/screen/next_page.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class ListenerWidget extends StatefulWidget {
  final Widget child;
  const ListenerWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<ListenerWidget> createState() => _ListenerWidgetState();
}

class _ListenerWidgetState extends State<ListenerWidget> {
  late Counter counterProvider;

  @override
  void initState() {
    counterProvider = context.read<Counter>();

    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   counterProvider.startTimer(context);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (PointerEvent details) {
          counterProvider.startTimer(context);
        },
        onPointerMove: (PointerEvent details) {
          counterProvider.startTimer(context);
        },
        onPointerUp: (PointerEvent details) {
          counterProvider.startTimer(context);
        },
        child: widget.child);
  }
}
