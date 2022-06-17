import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late String imageDayNight;
  @override
  Widget build(BuildContext context) {

      data = ModalRoute.of(context)?.settings.arguments as Map;//getting map data from Loading intent
      imageDayNight = data['isDay'] ? 'day.png' : 'night.png';
      late Color navBarBgColor = data['isDay'] ? Colors.orange : Colors.grey;
// print('home data :  $data');
    return Scaffold(
      backgroundColor: navBarBgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$imageDayNight'),
                fit: BoxFit.cover,
                opacity: 80
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[100],
                      ),
                      label: Text(
                          'Edit Location',
                           style: TextStyle(
                             color: Colors.white
                           ),
                      )),
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
                          fontSize: 60.0,
                        ),
                      )
                    ],
                  )
                ],


              ),
            ),
          )
      ),
    );
  }
}
