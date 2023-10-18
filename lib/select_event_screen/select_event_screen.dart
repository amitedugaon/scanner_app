import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/const/color.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../event_details_screen/event_details_screen.dart';
import '../shimmer/shimmer.dart';

class Event {
  final int id;
  final String eventName;
  final String startedAt;
  final String endedAt;
  final String startTime;
  final String endTime;
  final String location;
  final String featuredImage;

  Event({
    required this.id,
    required this.eventName,
    required this.startedAt,
    required this.endedAt,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.featuredImage,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      eventName: json['event_name'],
      startedAt: json['started_at'],
      endedAt: json['ended_at'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      location: json['location'],
      featuredImage: json['featured_image'],
    );
  }
}

class SelectEventScreen extends StatefulWidget {
  const SelectEventScreen({super.key});

  @override
  State<SelectEventScreen> createState() => _SelectEventScreenState();
}

class _SelectEventScreenState extends State<SelectEventScreen> {
  Future<List<Event>>? eventsFuture;

  @override
  void initState() {
    super.initState();
    eventsFuture = fetchData();
  }

  Future<List<Event>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://tickets-mascon.madwartech.com/api/events'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> eventsData = jsonData['data']['events'];

      final List<Event> eventList =
      eventsData.map((data) => Event.fromJson(data)).toList();

      return eventList;
    } else {
      throw "Failed to load events";
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(onTap: () {}, child: Text(" Event")),
        backgroundColor: statusBarColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: deviceHeight * .85,
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app), // Icon for logout
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Event>>(
        future: eventsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a circular progress indicator.
            // return Center(child: CircularProgressIndicator());
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300, // Change the colors as needed
              highlightColor: Colors.grey.shade100,
              child: YourShimmerWidget(), // Your custom Shimmer widget
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<Event> events = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  String dateString = events[index].startedAt;
                  DateTime dateTime = DateFormat("MM/dd/yyyy").parse(dateString);
                  String formattedMonth = DateFormat('MMMM').format(dateTime);
                  return InkWell(
                    onTap: () {
                      Get.to(()=>EventDetailsScreen(data: events[index].id));
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image:
                                  NetworkImage(events[index].featuredImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    events[index].eventName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    events[index].startTime +
                                        " AM" +
                                        " . " +
                                        dateTime.day.toString() +
                                        " " +
                                        formattedMonth,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    events[index].location,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("No data available."));
          }
        },
      ),
    );
  }
}
