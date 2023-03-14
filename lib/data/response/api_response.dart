
import 'package:getx_mvvm_api_app/data/response/status.dart';

class ApiRespons<T>{
  Status? status;
  T? data;
  String? message;

  ApiRespons(this.status, this.data, this.message);

  ApiRespons.loading(): status = Status.LOADING;
  ApiRespons.success(this.data): status = Status.SUCCESS;
  ApiRespons.error(this.message): status = Status.ERROR;
}