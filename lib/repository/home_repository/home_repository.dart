
import 'package:getx_mvvm_api_app/models/home/UserListModel.dart';
import 'package:getx_mvvm_api_app/res/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';

class HomeRepository{
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi()async{
    dynamic response = await _apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}