
// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart';

class Network{


  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String,String> headers = {'Content-type': 'application/json; charset=UTF-8'};

  // # API

  static String API_LIST = "/posts";

  static Object? get statusCode => null;

  /* Http Recuest */
  static Future GET(String api, Map<String ,String> params) async{
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  /* Params */
  static Map<String, String > paramsEmpty(){
    Map<String, String > params = {};
    return params;
  }
  
}

get(Uri uri, {required Map<String, String> headers}) {
}