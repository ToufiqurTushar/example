import 'package:flutter_rapid/flutter_rapid.dart';

extension Data on Map<String, TextEditingController> {
  Map<String, dynamic> data() {
    final res = <String, dynamic>{};
    for (MapEntry e in entries) {
      res.putIfAbsent(e.key, () => e.value?.text);
    }
    return res;
  }
}

//context extension
extension BuildContextEntension<T> on BuildContext {
  Color get searchBorderColor => Theme.of(this).primaryColor;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get appBarHeight => 50;
  double get appWidth => MediaQuery.of(this).size.width;
  double get appHeight => MediaQuery.of(this).size.height;
}
