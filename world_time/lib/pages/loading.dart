import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Karachi',flag: 'Pakistan.png',url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  
  }

  @override
  void initState() {
    super.initState();
     setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 49, 199),
        body: Center(
        child: Container(
              width: 80.0,
              height: 80.0,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 10.0,
            
          ),
        ),
      )
    );
      
  }
}