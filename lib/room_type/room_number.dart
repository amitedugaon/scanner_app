import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/student_attandance/student_attandance.dart';
import 'package:http/http.dart' as http;
import '../const/color.dart';
import '../room_info/room_info.dart';

class RoomNumber extends StatefulWidget {
  final int data;

  const RoomNumber({super.key,  required this.data});

  @override
  State<RoomNumber> createState() => _RoomNumberState();
}

class _RoomNumberState extends State<RoomNumber> {


  Future<List> fetchDataRoom() async {
    String apiUrl = "https://tickets-mascon.madwartech.com/api/programs/${widget.data}/rooms";
    final url =
    Uri.parse(apiUrl);
    const token = 'Bearer 161|dNuFDtUYPnT6HV8BOXeSEMW87AXtK4sg61noEpnv';
    final response = await http.get(
      url,
      headers: {
        'Authorization': token,
      },
    );
    var jsonDecoded = jsonDecode(response.body);
    List<dynamic> data = jsonDecoded["data"]["rooms"];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Room Number"), backgroundColor: statusBarColor),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List>(
            future: fetchDataRoom(),
            builder: (context, snapshot) {

                  if(snapshot.hasData){
                    List? data=snapshot.data;
                    return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(StudentAttendance);
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black, // Border color
                                  width: .5, // Border width
                                ),
                              ),
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: InkWell(
                                      onTap: () {
                                        fetchDataRoom();
                                      },
                                      child: const Icon(
                                        Icons.info,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      data[index]["name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          letterSpacing: 1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if(snapshot.hasError){
                    return Center(child: Text("Something error"),);
                  }
                  return Center(child: CircularProgressIndicator(),);
          },)
      ),
    );
  }
}
