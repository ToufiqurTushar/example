import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  VoidCallback? callback;

  Debouncer(this.callback, {required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  call(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  start() {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), callback!);
  }
}
