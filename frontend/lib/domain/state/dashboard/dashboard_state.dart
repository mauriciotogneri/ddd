import 'package:dafluta/dafluta.dart';

class DashboardState extends BaseState {
  int activeView = 0;

  void onActiveViewChange(int index) {
    activeView = index;
    notify();
  }
}
