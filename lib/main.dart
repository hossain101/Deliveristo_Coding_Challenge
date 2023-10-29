import 'package:deliveristo_coding_challenge/screens/home_screen.dart';

import 'package:deliveristo_coding_challenge/screens/by_breed.dart';
import 'package:deliveristo_coding_challenge/screens/by_sub_breed.dart';
import 'package:flutter/material.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/random_by_breed': (context) => By_Breed(),
        '/random_by_subBreed': (context) => By_SubBreed(),
      },
    );
  }
}
