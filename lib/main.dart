import 'package:deliveristo_coding_challenge/screens/home_screen.dart';
import 'package:deliveristo_coding_challenge/screens/list_image_breed.dart';
import 'package:deliveristo_coding_challenge/screens/list_image_sub_breed.dart';
import 'package:deliveristo_coding_challenge/screens/by_breed.dart';
import 'package:deliveristo_coding_challenge/screens/by_sub_breed.dart';
import 'package:flutter/material.dart';
import 'package:deliveristo_coding_challenge/screens/random_image_breed.dart'; // Import your RandomImageScreen
import 'package:deliveristo_coding_challenge/screens/image_list_screen.dart'; // Import your ImageListScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route to your home screen
      routes: {
        '/': (context) => HomeScreen(), // Create a HomeScreen for navigation
        '/random_by_breed': (context) =>
            By_Breed(), // Define routes for your screens
        '/random_by_subBreed': (context) =>
            By_SubBreed(), // Define routes for your screens

        // Define routes for your screens
      },
    );
  }
}
