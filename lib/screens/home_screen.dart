import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/random_image'); // Navigate to the random image screen
              },
              child: Text('Random Image by Breed'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/image_list'); // Navigate to the image list screen
              },
              child: Text('Images List by Breed'),
            ),
          ],
        ),
      ),
    );
  }
}
