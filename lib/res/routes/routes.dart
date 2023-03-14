
import 'package:get/get.dart';
import 'package:getx_mvvm_api_app/res/routes/routes_name.dart';
import 'package:getx_mvvm_api_app/view/home/home_screen.dart';
import 'package:getx_mvvm_api_app/view/login/login_view.dart';
import 'package:getx_mvvm_api_app/view/splash_screen.dart';


class AppRoutes{
  static appRoutes()=>[
 GetPage(name: RoutesName.splashScreen, page: ()=> SplashScreen(), transition:  Transition.leftToRightWithFade,
 transitionDuration: Duration(milliseconds: 250)),

    GetPage(name: RoutesName.loginView, page: ()=> LoginView(), transition:  Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 250)),

    GetPage(name: RoutesName.homeScreen, page: ()=> HomeScreen(), transition:  Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 250))
  ];
}