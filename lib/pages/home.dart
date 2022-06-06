import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

      data = ModalRoute.of(context)?.settings.arguments as Map;//getting map data from Loading intent
// print('home data :  $data');
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'))
            ],
          )),
    );
  }
}
