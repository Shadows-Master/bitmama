import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefExtension<T> on Ref<T>{
  void refreshIn(Duration duration){
    Timer(duration, () => invalidateSelf());
  }
}