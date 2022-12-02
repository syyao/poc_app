import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poc_app/screen/lock_page.dart';

import '../widget/lestener_widget.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  double x = 0.0;
  double y = 0.0;

  void increment() {
    _count++;
    notifyListeners();
  }

  //ELEMENT POUR LE COMPTE A REBOURE
  int _counter = 0;
  Timer? _timer;
  gotoLockScreen(BuildContext context) {
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => LockScreen()),
    //     (Route<dynamic> route) => false);

    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => const LockScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  startTimer(BuildContext context) {
    _counter = 15;
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print(timer.tick);
      if (_counter > 0) {
        _counter--;
      } else {
        _timer?.cancel();
        gotoLockScreen(context);
      }
    });
    notifyListeners();
  }

  //FIN
  incrementDown(PointerEvent details) {
    updateLocation(details);

    notifyListeners();
  }

  incrementUp(PointerEvent details) {
    updateLocation(details);

    notifyListeners();
  }

  updateLocation(PointerEvent details) {
    x = details.position.dx;
    y = details.position.dy;
    notifyListeners();
    print("$x * $y");
  }
}
