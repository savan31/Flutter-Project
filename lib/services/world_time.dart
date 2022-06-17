import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime {

  late String location; //for UI
  late String time ; //Live time of location which is inserted
  late String flag ; //url to  an asset flag icon
  late String url ; //location url from API endpoint
  late bool isDay; //check that is day or night

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    //Future will force dart to run that and we can use await
    try{
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //store properties from data
      String dateTime = data['utc_datetime'];
      String offSet = data['utc_offset'].substring(1,3);
      // print(dateTime + "  offset :"+ offSet);

      //create date time object
      DateTime liveTime = DateTime.parse(dateTime);
      liveTime = liveTime.subtract(Duration(hours: int.parse(offSet)));
      // print(liveTime);


      time = DateFormat.jm().format(liveTime);
      print(time);
      //check that day or night
      isDay = liveTime.hour > 6 && liveTime.hour < 20 ? true : false;
      print(isDay);
    }
    catch(e){
      print('Error for getting data : $e');
      time = 'Something went wrong in getting time';
    }

  }

}