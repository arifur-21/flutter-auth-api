
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_api_app/models/login/UserModel.dart';
import 'package:getx_mvvm_api_app/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_api_app/res/routes/routes_name.dart';
import 'package:getx_mvvm_api_app/utils/utils.dart';
import 'package:getx_mvvm_api_app/view_model/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository();
  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

void loginApi(){
  loading.value = true;
  Map data ={
    'email' : emailController.value.text,
    'password' : passwordController.value.text
  };
  _api.loginApi(data).then((value){
    loading.value = false;

    UserModel userModel = UserModel(
      token: value['token'],
      isLogin: true,
    );


   userPreference.saveUser(userModel).then((value){
     Get.toNamed(RoutesName.homeScreen);

   }).onError((error, stackTrace){

   });
    Utils.snakBar("Login", 'Login successfully');
  }).onError((error, stackTrace) {
    print("network Error : ${error.toString()}");
    loading.value = false;
    Utils.snakBar("Error", error.toString());
  });

}

}