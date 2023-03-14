
import 'package:get/get.dart';
import 'package:getx_mvvm_api_app/data/response/status.dart';
import 'package:getx_mvvm_api_app/models/home/UserListModel.dart';
import 'package:getx_mvvm_api_app/repository/home_repository/home_repository.dart';

class HomeController extends GetxController{

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi(){

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setUserList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }

  void refreshApi(){
    setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}