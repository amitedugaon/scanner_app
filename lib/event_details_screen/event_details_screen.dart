
//       body: FutureBuilder<GetParticluarEvent>(
//         future: fetchDataFromApi(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final event = snapshot.data;
//
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Event Name: ${event?.eventName}'),
//                   Text('Location: ${event?.location}'),
//                   Text('Start Time: ${event?.startTime}'),
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../class_type/class_type.dart';
import '../const/color.dart';

class GetParticluarEvent {
  int? id;
  String? eventName;
  String? createdAt;
  String? updatedAt;
  String? startedAt;
  String? endedAt;
  String? startTime;
  String? endTime;
  String? location;
  String? featuredImage;
  String? logo;
  int? isCloning;
  String? cloningProcess;
  String? cloningStartedAt;
  List<dynamic>? pageDetails;

  GetParticluarEvent({
     this.id,
     this.eventName,
     this.createdAt,
     this.updatedAt,
     this.startedAt,
     this.endedAt,
     this.startTime,
     this.endTime,
     this.location,
     this.featuredImage,
     this.logo,
     this.isCloning,
     this.cloningProcess,
     this.cloningStartedAt,
     this.pageDetails,
  });

  factory GetParticluarEvent.fromJson(Map<String, dynamic> json) {
    return GetParticluarEvent(
      id: json["id"],
      eventName: json["event_name"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      startedAt: json["started_at"],
      endedAt: json["ended_at"],
      startTime: json["start_time"],
      endTime: json["end_time"],
      location: json["location"],
      featuredImage: json["featured_image"],
      logo: json["logo"],
      isCloning: json["is_cloning"],
      cloningProcess: json["cloning_process"],
      cloningStartedAt: json["cloning_started_at"],
      pageDetails: List<dynamic>.from(json["page_details"].map((x) => x)),
    );
  }
}

class EventDetailsScreen extends StatefulWidget {
  final int data;

  const EventDetailsScreen({super.key,  required this.data});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {




Future<GetParticluarEvent> fetchDataFromApi() async {
  final response = await http.get(
    Uri.parse('https://tickets-mascon.madwartech.com/api/event/${widget.data}'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final eventData = jsonData['data']['event'][0];

    // Parse the JSON into your data model
    final GetParticluarEvent event = GetParticluarEvent.fromJson(eventData);

    return event;
  } else {
    throw Exception('Failed to load data from the API');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(" Event Details"), backgroundColor: statusBarColor),
      body: FutureBuilder<GetParticluarEvent>(
        future: fetchDataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final event = snapshot.data;

            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(event?.featuredImage ??""),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(event?.eventName ??"",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    letterSpacing: 1)),
                          ),
                        ),
                      ],
                    ),


                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 4),
                            child: Text(event?.location ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black54,
                                    letterSpacing: 1)),
                          ),
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
                                  text:"${event?.startedAt} ${event?.startTime} Am",
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
                                  text:"${event?.endedAt} ${event?.endTime} Pm",
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
                        InkWell(
                          onTap: () {
                            Get.to(()=> ProgramListFetcher(data:event!.id!));
                          },
                          child: Column(
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
          } else {
            return Center(child: Text('No data available'));
          }
        },
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
