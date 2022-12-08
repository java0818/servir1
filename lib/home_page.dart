// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:servir1/post/post_model.dart';
import 'package:servir1/services/http_services.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String? data;
  //String? data;

  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiCreatePost(Post post){
    Network.POST(Network.API_CREAT, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }


  void _showResponse(String? response){
    setState(() {
      if(response!=null){
        data = response;
      }else{
        data="no data";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement; initState
    super.initState();
    var post; Post(id: 1,title: "title",body: "body",userId: 1);
    _apiCreatePost(post );
  }

  @override
  Widget build(BuildContext context) {
    var  data;
    return Scaffold(
      body: Center(
        child: Text( data != null ? data : "No Data"),
      ),
    );
  }
}
