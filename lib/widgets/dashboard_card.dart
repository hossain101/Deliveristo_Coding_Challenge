import 'package:flutter/material.dart';
class DashboardCard extends  StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String backgroundImage; // New property for background image URL

  const DashboardCard({ required this.title, required this.onTap, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  NetworkImage(backgroundImage), // Load image from URL
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
           // padding: EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 26.0, color: Colors.white,fontWeight: FontWeight.bold), // Set text color to white for better visibility
              ),
            ),
          ),
        ),
      ),
    );
  }
}

