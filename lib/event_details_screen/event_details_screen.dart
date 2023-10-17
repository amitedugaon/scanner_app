import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/class_type/class_type.dart';
import 'package:scanner_app_flutter/student_attandance/student_attandance.dart';

import '../const/color.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  List<String> imageList = [
    "image/party1.jpg",
    "image/party2.jpg",
    "image/party3.jpg",
    "image/party4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(" Event Details"), backgroundColor: statusBarColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("image/party1.jpg"),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 4),
                  child: Text("Pride at The Disco",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          letterSpacing: 1)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 4),
                  child: Text("Westfield San Franclsco Centre",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54,
                          letterSpacing: 0.5)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 2),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "12 Jan 2021 , 12:00pm",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: statusBarColor, // Set the color to yellow
                          ),
                        ),
                        TextSpan(
                          text: "  to  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: "28 Jan 2021, 02:00pm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: statusBarColor // Set the color to yellow
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
               Get.to(const ClassType());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Total Ticket Sales",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        child: SizedBox(
                          height: 120,
                          width: 150,
                          child: CircleProgressIndicator(750 / 1000),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Attendance",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        child: SizedBox(
                          height: 120,
                          width: 150,
                          child: CircleProgressIndicator(98 / 100),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Attendees badges",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      child: SizedBox(
                        height: 120,
                        width: 150,
                        child: CircleProgressIndicator(750 / 1000),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Scan Staff badges",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      child: SizedBox(
                        height: 120,
                        width: 150,
                        child: CircleProgressIndicator(98 / 100),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleProgressIndicator extends StatelessWidget {
  final double progress;

  CircleProgressIndicator(this.progress);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100, 100), // Adjust the size as needed
      painter: CircleProgressPainter(progress),
      child: Center(
        child: Text("98/\n100"),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress; // Progress value between 0 and 1

  CircleProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 15; // Adjust as needed
    final double radius = size.width / 3 - strokeWidth / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Paint backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    final double arcAngle = 2 * 3.14 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 / 2, // Start at the top
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // This depends on your use case
  }
}
