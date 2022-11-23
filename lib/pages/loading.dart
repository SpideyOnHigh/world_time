import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/wordl_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ="Loading";

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', urlEnd: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : instance.location,
      'flag': instance.flag,
      'time' :instance.time,
      'isItDay' : instance.isItDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );

  }
}


