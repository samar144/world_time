import 'dart:ffi';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location = ""; // location name for the UI.
  String time = ""; //the time of location
  String flag = ""; // url of assert flag of country
  String url = ""; // url of country for api endpoint
  bool isDaytime = true;
  WorldTime(
      {this.flag = "",
      this.location = "",
      this.url = "",
      this.isDaytime = true});

  Future<void> getTime() async {
    try {
//make the request
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      //print(offset);

      //creat DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caut error:$e');
      time = "couldn't get time data";
    }
  }
}
