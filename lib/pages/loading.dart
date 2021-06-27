import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



void setupWorldTime() async{
  WorldTime w = WorldTime(location: 'berlin',url: 'Asia/Dhaka',flag: 'germany.png');
  await w.getData();
  //adding third parameter (A MAP) to send data to the widget/screen we route to
  //in this case its home.dart
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': w.location,
    'flag': w.flag,
    'time': w.time,
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
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text('loading'),
      ),
    );
  }
}
