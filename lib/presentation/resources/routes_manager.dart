import 'package:flutter/material.dart';
import '../resources/strings_manager.dart';
import '../shop_details/shop_details.dart';
import '../forget_password/forget_password.dart';
import '../main_view/main_view.dart';
import '../onboarding/onboarding.dart';
import '../splash/splash.dart';
import '../login/login.dart';
import '../register/register.dart';

class Routes {
  static const String onBoardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String splashRoute = "/splash";
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/main';
  static const String shopDetailsRoute = '/shopDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.shopDetailsRoute:
        return MaterialPageRoute(builder: (_) => ShopDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.notFountRoute),
            ),
            body: const Center(
              child: Text(AppStrings.notFountRoute),
            )));
  }
}
