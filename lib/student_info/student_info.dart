import 'package:flutter/material.dart';
import 'package:scanner_app_flutter/const/color.dart';



class StudentInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information'),backgroundColor: statusBarColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('image/splash.png'), // Replace with your student's image
            ),
            SizedBox(height: 16),
            Text(
              'Amit Singh',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Class: 12th Grade',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Roll Number: 12345',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'DOB: 01/15/2005',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email: johndoe@email.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Phone: +1 (555) 555-5555',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Address: 123 Main St, City, State',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
