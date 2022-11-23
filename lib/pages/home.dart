import 'package:flutter/material.dart';
import 'package:world_time/services/wordl_time.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  refreshTime(data){
    WorldTime(location: data['location'],flag: data['flag'],urlEnd: data['urlEnd']);

  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ?data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage =  data['isItDay'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isItDay'] ? Colors.lightBlue[900] : Colors.black;

    print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async{
                         Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            // 'time' : result['time'],
                            // 'location' : result['location'],
                            // 'flag': result['flag'],
                            // 'isItDay' : result['isItDay'],
                          };
                        });
                      } ,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: Icon(Icons.edit_location),
                      label: Text("Edit Location")),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton.icon(
                      onPressed: (){
                        setState(() {

                        });
                      },
                      icon: Icon(Icons.refresh),
                      label: Text("Refresh Time"),
                      style: TextButton.styleFrom(foregroundColor: Colors.white,
                      ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
