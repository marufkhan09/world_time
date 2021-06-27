import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location; //location name for the ui
  String time = ''; //time in that location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getData() async {

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set the time property
      this.time = now.toString();
    }
    catch(e){
    print('caught error: $e');
    time = 'could not get time data';
    }



  }
}

