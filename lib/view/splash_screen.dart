
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm_api_app/res/components/internet_expection.dart';
import 'package:getx_mvvm_api_app/res/components/round_button.dart';
import 'package:getx_mvvm_api_app/view_model/services/splash_services.dart';

import '../res/components/general_exception.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 SplashServices splashServices = SplashServices();

 @override
  void initState() {
    splashServices.isLogin();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child:  Text("Welcome\n Back", textAlign: TextAlign.center,),)
      ),
    );
  }
}
