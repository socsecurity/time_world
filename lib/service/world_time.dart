import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location, this.time, this.flag, this.url});

  Future<void> getTime() async {
    //no hoan thanh xong het cai void moi lam cai khac, await for void
    print('Taking data from server...');

    try {
      //make a request
      Response response = await get(
          'https://timezone.abstractapi.com/v1/current_time/?api_key=de8a8070d0bb4f0598577b9d5228111d&location=$url');
      Map data = jsonDecode(response.body);

      //get preoperties from data
      String datetime = data['datetime'];
      int offset = data['gmt_offset'];

      DateTime now = DateTime.parse(datetime);
      //now = now.add(Duration(hours: offset));

      //set the time property
      //time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error');
      time = 'Cannot get TIME';
    }
  }
}
