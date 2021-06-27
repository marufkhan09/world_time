import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    //inside this build method we receive the actual arguments we send from
    //loading Screen
    //as Map added in newer version

    //here we didn't use setState because this is the first time the build function runs
    //we are declaring data and overriding the empty map to populate with data send from
    //loading screen before we return anything from build statement.
    //so we are doing this first and then build up the widget tree
   data = ModalRoute.of(context)!.settings.arguments as Map;
   print(data);
   //set background
   String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
   Color bgColor = data['isDayTime'] ? Colors.lightBlue : Colors.indigo;
   Color tx = data['isDayTime'] ? Colors.black : Colors.grey.shade400;

    return Scaffold(
      backgroundColor: bgColor,
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
              TextButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/choose_location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: tx,
                  ),
                  label: Text('Edit Location',
                  style: TextStyle(
                    color: tx,
                  ),
                  ),
              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: tx,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: tx,
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
