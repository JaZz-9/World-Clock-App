import 'package:flutter/material.dart';
import 'package:try2/pages/home.dart';
import 'package:try2/pages/choose_location.dart';
import 'package:try2/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0
        )


      )
    );
  }
}
