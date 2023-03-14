
class AppExceptions implements Exception{

  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString(){
    return '$_prefix, $_message';
  }
}

class InternetException extends AppExceptions{
InternetException([String? messaage]) : super (messaage, 'No internet');
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? messaage]) : super (messaage, "Request Time out");
}

class ServerException extends AppExceptions{
  ServerException([String? messaage]) : super (messaage, "Internel Server error");
}

class InvalidUrlException extends AppExceptions{
  InvalidUrlException([String? messaage]) : super (messaage, "Invalid Url");
}

class featchDataException extends AppExceptions{
  featchDataException([String? messaage]) : super (messaage, "");
}