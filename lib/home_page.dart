// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:servir1/services/http_services.dart';

//import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String data;

  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((respons) => {
      // ignore: avoid_print
      print(respons),
      _showResponse(respons),
    });
  }


  void _showResponse(String respons){
    setState(() {
      data = respons;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
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
