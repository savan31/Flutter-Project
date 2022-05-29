import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{

      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/America/Argentina/Salta'));
      // print(response.body);
      Map data = jsonDecode(response.body);

      //store properties from data
      String dateTime = data['utc_datetime'];
      String offSet = data['utc_offset'].substring(1,3);
      print(dateTime + "  offset :"+ offSet);

      //create date time object
      DateTime liveTime = DateTime.parse(dateTime);
      liveTime = liveTime.subtract(Duration(hours: int.parse(offSet)));
      print(liveTime);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Page'),
    );
  }
}
