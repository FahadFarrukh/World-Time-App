

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(data);

    String bgImage = data['isDaytime'] ? 'day2.jpg' : 'night2.jpg';
    Color bgColor = data['isDaytime']
        ? Color.fromARGB(255, 153, 153, 153)
        : Color.fromARGB(255, 23, 22, 22);
    Color txtColor = data['isDaytime']
        ? Color.fromARGB(255, 89, 108, 118)
        : Color.fromARGB(255, 255, 255, 255);
         Color iconColor = data['isDaytime']
        ? Color.fromARGB(255, 0, 0, 0)
        : Color.fromARGB(255, 255, 255, 255);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        iconTheme: IconThemeData(
    color: iconColor, // Set the color of the drawer icon to black
  ),
      ),
drawer:Drawer(
  backgroundColor: bgColor,
   child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height:25.0),
                TextButton(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  if (result != null) {
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20.0,),
                    Icon(
                      Icons.edit_location,
                      color: iconColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: iconColor,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:10),
          
            ],
          ),
        ),
      ),
),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
            
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 70.0,
                      letterSpacing: 1,
                      color: txtColor,
                      fontFamily: 'IndieFlower',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 20,
                ),
                child: Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 106.0,
                    letterSpacing: 3.0,
                    color: txtColor,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'digital-7',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
