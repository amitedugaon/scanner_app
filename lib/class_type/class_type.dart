import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/room_type/room_number.dart';

import '../const/color.dart';

class ClassType extends StatefulWidget {
  const ClassType({super.key});

  @override
  State<ClassType> createState() => _ClassTypeState();
}

class _ClassTypeState extends State<ClassType> {
  List<String> classname = ["DayCare", "School", "Youn Youth", "Youth"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Class Name"), backgroundColor: statusBarColor),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: classname.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(const RoomNumber());
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
                    child: Center(
                        child: Text(
                      classname[index],
                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 1),
                    )),
                  ),
                ),
              );
            },
          )),
    );
  }
}
