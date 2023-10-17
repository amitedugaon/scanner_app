import 'dart:convert';

import '../data_model/get_all_event_data_model.dart';
import 'package:http/http.dart' as http;
class GetData{
  Future<GetEvent> fetchDataFromApi() async {
    String apiUrl = "https://tickets-mascon.madwartech.com/api/events";
    var response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode==200){
      final Map<String, dynamic> jsonData = json.decode(response.body); // Parse JSON data as a map
      return GetEvent.fromJson(jsonData);
    }
    else{
      throw "Something error";
    }
  }
}