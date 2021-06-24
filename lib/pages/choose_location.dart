import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  void getData() async {
    //we are going to simulate a network request for a user.
   String a = await Future.delayed(Duration(seconds: 3,),(){
      return '1st';
    });
   String b = await Future.delayed(Duration(seconds: 2,),(){
      return '2nd';
    });


    print('$a - $b');
  }
  //simulate network request to get bio of the username



  @override
  void initState() {
    super.initState();
    getData();
    print('Init state function ran');

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
      body: TextButton.icon(
          onPressed: (){
        setState(() {
          counter+=1;
        });
      }, icon: Icon(
        Icons.add,
      ), label: Text('counter: $counter')),
    );
  }
}
