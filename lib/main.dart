
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_api_app/res/routes/routes.dart';
import 'package:getx_mvvm_api_app/view/splash_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),

    );
  }
}
