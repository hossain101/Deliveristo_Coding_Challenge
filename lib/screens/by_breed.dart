import 'package:deliveristo_coding_challenge/screens/random_image_breed.dart';
import 'package:deliveristo_coding_challenge/widgets/breed_dropdown.dart';
import 'package:flutter/material.dart';

import '../api/dog_api.dart';
import 'list_image_breed.dart';

class By_Breed extends StatefulWidget {
  By_Breed({super.key});

  @override
  State<By_Breed> createState() => _By_BreedState();
}

class _By_BreedState extends State<By_Breed> {
  @override
  initState() {
    super.initState();
  }

  String breed = "affenpinscher";

  Future<List<String>> breeds = DogAPI.fetchDogBreedsList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap your widget with a Scaffold
      appBar: AppBar(
        title: const Text('Random Image by Breed'), // Set your app bar title
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
                      setState(() {});
                      this.breed = BreedDropdown.breed;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          await MaterialPageRoute(
                              builder: (context) =>
                                  RandomImageBreed(breed: breed)));
                    },
                    child: Text('Show Random Image'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          await MaterialPageRoute(
                              builder: (context) =>
                                  ListImageBreed(breed: breed)));
                    },
                    child: Text('LIst Image'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(200, 50),
                    ),
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
