import 'package:flutter/material.dart';
import 'package:scanner_app_flutter/student_info/student_info.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../const/color.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({super.key});

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Attendance"),
        backgroundColor: statusBarColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search Name",
                border: OutlineInputBorder(),
                labelText: 'Search Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Password";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ),
                    );
                    setState(() {
                      if (res is String) {
                        // Handle the result
                      }
                    });
                  },
                  child: Card(
                    color: Colors.white30,

                    child: Stack(
                      children: [
                        ListTile(
                          title: Text("Name", style: TextStyle(color: Colors.black)),
                          subtitle: Text("36673873", style: TextStyle(color: Colors.black)),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                          ),
                        ),
                        Positioned(
                        right: 0,
                          top: 0,
                          child: IconButton(
                            icon: Icon(Icons.info,color: Colors.lightBlue,), // Add your info icon here
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentInfoScreen(),));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
