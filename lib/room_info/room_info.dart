import 'package:flutter/material.dart';
import 'package:scanner_app_flutter/const/color.dart';



class RoomInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Information'),backgroundColor: statusBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Name: Room 101',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Location: Building A, Floor 1',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Capacity: 30 people',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Facilities: Projector, Whiteboard, Seating',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'This room is suitable for meetings and presentations. It can accommodate up to 30 people and is equipped with essential facilities for your needs.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
