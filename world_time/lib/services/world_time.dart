import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {

  String location; // location name for the ui
  String time = ""; //the time in that location
  String flag; //url to an asset flag url
  String url; // location url for api endpoint
  bool isDaytime = false;


  WorldTime({required this.location,required this.flag,required this.url });


  Future<void> getTime() async {

    try{
      

   final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
  Map data = jsonDecode(response.body);
  //print(data);
 
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(0,3);
  //print(datetime);
  //print(offset);

  //creating datetime object
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));

  // set the time
  isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
  time = DateFormat.jm().format(now);

    }
    catch (e){
        print('caught Error: $e');
        time = 'error';
    }



}


}

