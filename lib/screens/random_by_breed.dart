import 'package:flutter/material.dart';

import '../api/dog_api.dart';

class Random_By_Breed extends StatefulWidget {
  Random_By_Breed({super.key});

  @override
  State<Random_By_Breed> createState() => _Random_By_BreedState();
}

class _Random_By_BreedState extends State<Random_By_Breed> {
  String breed = "bulldog";
  String imageURL = "";
  Future<List<String>> breeds = DogAPI.fetchDogBreedsList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap your widget with a Scaffold
      appBar: AppBar(
        title: Text('Dog Breeds'), // Set your app bar title
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
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: breedList!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(breedList[index]), // Display each dog breed
                      );
                    },
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
