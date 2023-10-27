import 'package:deliveristo_coding_challenge/widgets/breed_dropdown.dart';
import 'package:flutter/material.dart';

import '../api/dog_api.dart';

class Random_By_Breed extends StatefulWidget {
  Random_By_Breed({super.key});

  @override
  State<Random_By_Breed> createState() => _Random_By_BreedState();
}

class _Random_By_BreedState extends State<Random_By_Breed> {
  String breed = "";
  String imageURL = "";
  Future<List<String>> breeds = DogAPI.fetchDogBreedsList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap your widget with a Scaffold
      appBar: AppBar(
        title: Text('Random Image by Breed'), // Set your app bar title
      ),
      body: FutureBuilder<List<String>>(
        future: breeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  CircularProgressIndicator(), // Center the loading indicator
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"), // Display error message
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No data available."), // Display no data message
            );
          } else {
            List<String>? breedList = snapshot.data;
            return Container(
              color: Colors.black54,
              padding: EdgeInsets.all(20), // Add padding to the container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BreedDropdown(
                    breedList: breedList,
                    onChanged: (String? newValue) {
                      setState(() {
                        breed = newValue ?? '';
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Send to Next Page'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
