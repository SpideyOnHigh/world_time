import 'package:flutter/material.dart';

import '../services/wordl_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(location: 'India', flag: 'india.jpg', urlEnd: 'Asia/Kolkata'),
    WorldTime(urlEnd: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlEnd: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlEnd: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlEnd: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlEnd: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlEnd: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlEnd: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlEnd: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location' : instance.location,
        'flag': instance.flag,
        'time' :instance.time,
        'isItDay' : instance.isItDay,
    });
    // Navigator.pop(context,{
    //   'location' : instance.location,
    //   'flag': instance.flag,
    //   'time' :instance.time,
    //   'isItDay' : instance.isItDay,
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Choose a Location"),
    backgroundColor: Colors.blue.shade900,
    centerTitle: true,
    ),
    body: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(
                "${locations[index].location}"
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${locations[index].flag}"),
              ),
            ),
          ),
        );
      },
    )
    );
  }
}
