import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String liveTime = 'Loading';

   void setTime() async{
    WorldTime worldTime = WorldTime(location:'Salta' , flag: 'America.png' , url:'America/Argentina/Salta' );
    await worldTime.getTime();
    // print('World time' + worldTime.time);
    setState(() {
      liveTime = worldTime.time;
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'time' :worldTime.time,
        'location' :worldTime.location,
        'flag' :worldTime.flag
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 50.0,
        )
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
