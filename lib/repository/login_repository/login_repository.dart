
import 'package:getx_mvvm_api_app/data/network/network_api_services.dart';
import 'package:getx_mvvm_api_app/res/app_url/app_url.dart';

class LoginRepository{
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data)async{

    dynamic response = await _apiServices.postApi(data, AppUrl.loginApi);
    return response;

  }
}