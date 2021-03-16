import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time;    // time in that location
  String flag;    //  url to asset flag icon
  String url;    // location url for api endpoint
  bool isDayTime; // daytime or not

  WorldTime(
  {
    this.location,
    this.flag,
    this.url});

    Future<void> getTime() async {
      try {
        Response response = await get('https://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        // print(data);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        isDayTime =  now.hour >= 6 && now.hour <= 20 ? true : false;

        // set time property
        time = DateFormat.jm().format(now);
        // print(now);
      }

      catch (e) {
        print('caught error: $e');
        time = 'Could not get time data';
      }

  }

}

