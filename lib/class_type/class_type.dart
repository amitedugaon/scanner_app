import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scanner_app_flutter/const/color.dart';
import '../room_type/room_number.dart';

class ProgramListFetcher extends StatefulWidget {
  final int data;

  const ProgramListFetcher({super.key,  required this.data});
  @override
  _ProgramListFetcherState createState() => _ProgramListFetcherState();
}

class _ProgramListFetcherState extends State<ProgramListFetcher> {
  List<String> programNames = [];
  List<String> programNamesIndex = [];

  @override
  void initState() {
    super.initState();
    fetchApiData();
  }

  Future<void> fetchApiData() async {
    final url =
        Uri.parse('https://tickets-mascon.madwartech.com/api/programs/${widget.data}');
    const token = 'Bearer 161|dNuFDtUYPnT6HV8BOXeSEMW87AXtK4sg61noEpnv';

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonDecoded = jsonDecode(response.body);
        List<dynamic> program_name = jsonDecoded["data"]["programs"];
        int program_name_length = jsonDecoded["data"]["programs"].length;
        for (int i = 0; i < program_name_length; i++) {
          programNames.add(jsonDecoded["data"]["programs"][i]["program_name"]);
          programNamesIndex.add(jsonDecoded["data"]["programs"][i]["id"]);

        }
        setState(() {});
      } else {
        print("Failed to fetch data. Response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error while fetching data------------: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Program List Fetcher'),
          backgroundColor: statusBarColor,
        ),
        body: programNames.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: programNames.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(()=>  RoomNumber(data: 5,));

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: deviceWidth * .9,
                          height: deviceHeight * .1,
                          child: Card(
                            elevation: 2,
                            child: Center(
                              child: Text(
                                programNames[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          )),
                    ),
                  );
                },
              ));
  }
}
