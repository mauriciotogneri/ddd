import 'package:dafluta/dafluta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testflow/utils/navigation.dart';

class SplashState extends BaseState {
  void init(BuildContext context) {
    if (kDebugMode) {
      Delayed.post(() => context.go(Navigation.PATH_HOME));
    } else {
      Delayed.post(() => context.go(Navigation.PATH_SIGNIN));
    }
  }
}
