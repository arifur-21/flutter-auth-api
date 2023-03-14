
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_api_app/data/response/status.dart';
import 'package:getx_mvvm_api_app/res/components/internet_expection.dart';
import 'package:getx_mvvm_api_app/res/routes/routes_name.dart';
import 'package:getx_mvvm_api_app/view_model/controller/home/home_view_model.dart';
import 'package:getx_mvvm_api_app/view_model/controller/user_preference/user_preference_view_model.dart';

import '../../res/components/general_exception.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserPreference userPreference = UserPreference();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  actions: [
    IconButton(onPressed: (){
      userPreference.removeUser().then((value) {
        Get.toNamed(RoutesName.loginView);

      });
    }, icon: Icon(Icons.logout))
  ],
),
      
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child:  CircularProgressIndicator(),);

          case Status.ERROR:
            if(homeController.error.value == 'No internet'){
              return InternetException(onPress: (){
               homeController.refreshApi();
              });
            }else{
              return GeneralException(onPress: () { homeController.refreshApi();},

              );
            }

          case Status.SUCCESS:
            return ListView.builder(
              itemCount: homeController.userList.value!.data!.length,
                itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController.userList.value!.data![index].avatar.toString()),
                    ),
                    title: Text(homeController.userList.value!.data![index].firstName.toString()),
                    subtitle: Text(homeController.userList.value!.data![index].lastName.toString()),
                  ),
                );
                });

        }

      }),
    );
  }
}
