import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/student_attandance/student_attandance.dart';

import '../const/color.dart';
import '../room_info/room_info.dart';

class RoomNumber extends StatefulWidget {
  const RoomNumber({super.key});

  @override
  State<RoomNumber> createState() => _RoomNumberState();
}

class _RoomNumberState extends State<RoomNumber> {
  List<String> roomNumber = ["101", "103"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Room Number"), backgroundColor: statusBarColor),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: roomNumber.length,
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
                              Get.to(RoomInfoScreen());
                            },
                            child: const Icon(
                              Icons.info,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Center(
                          child:  Text(
                            roomNumber[index],
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
