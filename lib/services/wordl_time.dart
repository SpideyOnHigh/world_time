import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  String location; //location name for the ui
  String time = "0"; //time in that location
  String flag; //url to asset flag icon
  String urlEnd; //location url for APIEndpoint
  bool isItDay = true;

  WorldTime({required this.location,required this.flag,required this.urlEnd});


  Future<void> getTime() async {

    try {
      //make http api request
      String api = 'https://worldtimeapi.org/api/timezone/$urlEnd';
      final Uri url = Uri.parse(api);
      final response = await get(url);
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offsethr = data['utc_offset'].substring(0, 3);
      String offsetmin = data['utc_offset'].substring(4, 6);

      //create DateTime Object
      DateTime now = DateTime.parse(datetime);
      print('before $now');
      now = now.add(
          Duration(hours: int.parse(offsethr),minutes: int.parse(offsetmin)));

      isItDay = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat().add_jm().format(now);
      print(" after $now");
      print(time);
    }
    catch(e){
      print(e);
    }

  }


}