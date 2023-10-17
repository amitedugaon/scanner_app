import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/const/color.dart';
import 'package:scanner_app_flutter/controller/get_all_event.dart';

import '../event_details_screen/event_details_screen.dart';

class SelectEventScreen extends StatefulWidget {
  const SelectEventScreen({super.key});

  @override
  State<SelectEventScreen> createState() => _SelectEventScreenState();
}

class _SelectEventScreenState extends State<SelectEventScreen> {
  List image = ["party1.jpg", "party2.jpg", "party3.jpg", "party4.jpg"];
  List showName = [
    "Diva Royale - Drag Queen show San Francisco",
    "Pink Block Party / Poolside Hercules & Love  Affair...",
    "Afterglow 2019: Pink Saturday Black Light Discotheque",
    "San Francisco Pride 19 Grandstand Seating"
  ];
  List showTime = [
    "10 Apr , 10:00Pm",
    "12 Apr , 12:00Pm",
    "15 Apr , 10:00pm",
    "30 Apr , 9:00pm"
  ];
  List showLocation = [
    "The Cosmo Bar and Lou..",
    "The Great Northern",
    "Space 556",
    "United Nations Plaza"
  ];

  var instanceOfController=Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: InkWell(
            onTap: () {
            },
              child: Text(" Event")
          ),
          backgroundColor: statusBarColor),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: deviceHeight * .85,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app), // Icon for logout
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Obx((){
            if(instanceOfController.isLoading.value){
              return Center(child: CircularProgressIndicator(),);
            }
            return
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: instanceOfController.listOfData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(const EventDetailsScreen());
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
                                      image: AssetImage(instanceOfController.listOfData[index].featuredImage),
                                      fit: BoxFit
                                          .cover, // You can adjust the fit as needed
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
                                        showName[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                          17, // Adjust the font size as needed
                                        ),
                                        maxLines: 2, // Limit text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Truncate text with ellipsis if it doesn't fit
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        showTime[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors
                                                .black54 // Adjust the font size as needed
                                        ),
                                        maxLines: 2, // Limit text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Truncate text with ellipsis if it doesn't fit
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        showLocation[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors
                                                .black54 // Adjust the font size as needed
                                        ),
                                        maxLines: 2, // Limit text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Truncate text with ellipsis if it doesn't fit
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              );
      })
    );
  }
}

