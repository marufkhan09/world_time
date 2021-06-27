import 'package:flutter/material.dart';
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
  print(w.time);
}


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }
}
