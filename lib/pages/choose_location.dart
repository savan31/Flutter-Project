import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async{
    String userName =await Future.delayed(Duration(seconds: 3),(){
      return 'John';
    });

    String bioData = await Future.delayed(Duration(seconds: 2),(){
      return 'John';
    });

    print('$userName : $bioData');
  }
  int addition = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
      body: RaisedButton(
        onPressed: (){
          setState(() {
            addition++;
          });
        },
        child:Text('Addition is $addition'),
      ),
    );
  }
}
