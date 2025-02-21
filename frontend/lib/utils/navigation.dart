import 'package:go_router/go_router.dart';
import 'package:testflow/presentation/auth/sign_in_screen.dart';
import 'package:testflow/presentation/home/home_screen.dart';
import 'package:testflow/presentation/splash/splash_page.dart';

class Navigation {
  static String get PATH_ROOT => '/';
  static String get PATH_SIGNIN => '/sign-in';
  static String get PATH_HOME => '/home';

  static List<RouteBase> get routes => [
    GoRoute(
      path: PATH_ROOT,
      builder: (context, state) => SplashPage.instance(),
    ),
    GoRoute(
      path: PATH_SIGNIN,
      builder: (context, state) => SignInScreen.instance(),
    ),
    GoRoute(
      path: PATH_HOME,
      builder: (context, state) => HomeScreen.instance(),
    ),
  ];
}
