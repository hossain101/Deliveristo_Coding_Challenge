import 'package:deliveristo_coding_challenge/screens/home_screen.dart';
import 'package:deliveristo_coding_challenge/screens/random_by_sub_breed.dart';
import 'package:flutter/material.dart';
import 'package:deliveristo_coding_challenge/screens/random_image_screen.dart'; // Import your RandomImageScreen
import 'package:deliveristo_coding_challenge/screens/image_list_screen.dart'; // Import your ImageListScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route to your home screen
      routes: {
        '/': (context) => const RandomSubBreed(), // Create a HomeScreen for navigation
        '/random_image': (context) => RandomImageScreen(), // Define routes for your screens
        '/image_list': (context) => ImageListScreen(),
      },
    );
  }
}
