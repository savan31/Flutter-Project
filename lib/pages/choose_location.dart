import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
  WorldTime(location:'America Salta' , flag: 'america.jpg' , url:'America/Argentina/Salta' ),
  WorldTime(location:'Africa Accra' , flag: 'africa.jpg' , url:'Africa/Accra' ),
  WorldTime(location:'Australia Melbourne' , flag: 'australia.jpg' , url:'Australia/Melbourne' ),
  WorldTime(location:'Pacific Auckland' , flag: 'auckland.jpg' , url:'Pacific/Auckland' ),
  WorldTime(location:'Indian Maldives' , flag: 'maldivs.jpg' , url:'Indian/Maldives' ),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'time' :instance.time,
      'location' :instance.location,
      'flag' :instance.flag,
      'isDay' :instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    print('buid funcation called');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                print('${locations[index].flag}');
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),

              ),
            ),
          );
        },
      ),
    );
  }
}
