import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  List<WorldTime> location = [
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Madrid', flag: 'Spain.jpeg', url: 'Europe/Madrid'),
    WorldTime(location: 'Oslo', flag: 'norway.png', url: 'Europe/Oslo'),
    WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    WorldTime(location: 'Sydney', flag: 'aus.png', url: 'Australia/Sydney'),
    WorldTime(location: 'Melbourne', flag: 'aus.png', url: 'Australia/Melbourne'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Singapore', flag: 'singapore.png', url: 'Asia/Singapore'),
    WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Dhaka', flag: 'BD.jpeg', url: 'Asia/Dhaka'),
    WorldTime(location: 'Toronto', flag: 'canada.png', url: 'America/Toronto'),

  ];

  void updateTime(index) async {
    WorldTime i = location[index];
    await i.getData();
    //navigate to home Screen and pass the data
    Navigator.pop(context, {
      'location': i.location,
      'flag': i.flag,
      'time': i.time,
      'isDayTime': i.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build function ran : $counter times');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,

      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              color: Colors.green[100],
              child: ListTile(
                contentPadding: EdgeInsets.all(25),
                onTap: (){
                  updateTime(index);

                },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
