import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{
      Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      print(response.body);
      Map data = jsonDecode(response.body);
      print(data['title']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Page'),
    );
  }
}
