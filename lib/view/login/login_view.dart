
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_api_app/view_model/controller/login/login_view_model.dart';

import '../../res/components/round_button.dart';
import '../../utils/utils.dart';





class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVm = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVm.emailController.value,
                    focusNode: loginVm.emailFocusNode.value,

                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snakBar("Email", "Enter Email");
                      }
                    },
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, loginVm.emailFocusNode.value,  loginVm.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText: 'email',
                        border: OutlineInputBorder()
                    ),
                  ),

                  SizedBox(height: 16,),

                  TextFormField(
                    controller: loginVm.passwordController.value,
                    focusNode: loginVm.passwordFocusNode.value,
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snakBar("password", "Enter passwordd");
                      }
                    },
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, loginVm.emailFocusNode.value,  loginVm.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder()
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40,),

           Obx(() =>  RoundButton(
               width: 200,
               title: "Login",
               loading: loginVm.loading.value,
               onPress: (){
                 if(_formKey.currentState!.validate()){
                   loginVm.loginApi();
                 }
               }))

          ],
        ),
      ),
    );
  }
}
