import 'package:flutter/material.dart';
import 'package:try2/pages/home.dart';
import 'package:try2/pages/loading.dart';
import 'package:try2/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'uk.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'uk.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'uk.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'uk.png'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'uk.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'uk.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'uk.png'),
    WorldTime(url: 'America/Cairo', location: 'Cairo', flag: 'uk.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('init runs');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
              child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                  title : Text(locations[index].location),
               ),
              ),
            );
      }
      ),
      );

  }
}
