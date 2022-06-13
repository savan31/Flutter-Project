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

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/');
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location')),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data['location'],
                      style: TextStyle(
                        fontSize: 35.0
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    )
                  ],
                )
              ],


            ),
          )
      ),
    );
  }
}
