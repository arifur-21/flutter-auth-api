
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm_api_app/data/app_exceptions.dart';
import 'package:getx_mvvm_api_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{



  @override
  Future getApi(String url) async {

    if(kDebugMode){
      print(url);
    }

    dynamic responseJson;

   try{
     final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
     responseJson = returnResponse(response);
   }on SocketException{
     throw InternetException("");
   }on RequestTimeOut{
     throw RequestTimeOut('');
   }
   return responseJson;
  }

  @override
  Future postApi(var data, String url) async{
    if(kDebugMode){
      print(data);
    }
    dynamic responseJson;

    try{
      final response = await http.post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException("");
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    if(kDebugMode){
      print(responseJson);
    }
    return responseJson;

  }



  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException;
      default:
        throw featchDataException("Error accoured while communication with server"+ response.statusCode.toString());
    }
  }


}