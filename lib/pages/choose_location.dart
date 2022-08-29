//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // int c = 0;
  // void initState() {
  //   super.initState();
  //   print('ssssss');
  // }
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Beirut', location: 'Lebanon', flag: 'lebanon.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunisia', flag: 'tunisis.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Khartoum', location: 'Sudan', flag: 'Sudan.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Saudi Arabia', flag: 'saudia.png'),
    WorldTime(
        url: 'Asia/Dubai', location: 'United Arab Emirates', flag: 'UAE.png'),
    WorldTime(url: 'Asia/Amman', location: 'Jordan', flag: 'Jordan.png'),
    WorldTime(url: 'Asia/ Damascus', location: 'Syria', flag: 'syria.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ddddddddd');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:
          // RaisedButton(
          //   onPressed: () {
          //     setState(() {
          //
          //
          //
          //  c += 1;
          //     });
          //   },
          //   child: Text('counter is $c'),
          // ),
          ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${locations[index].flag}'),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
