import 'package:deliveristo_coding_challenge/screens/random_image_breed.dart';
import 'package:deliveristo_coding_challenge/widgets/breed_dropdown.dart';
import 'package:flutter/material.dart';

import '../api/dog_api.dart';
import 'list_image_breed.dart';

class By_Breed extends StatefulWidget {
  const By_Breed({super.key});

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
        title: const Text('Random Image by Breed'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepPurple[200], // Set your app bar title
      ),
      body: FutureBuilder<List<String>>(
        future: breeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(), // Center the loading indicator
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"), // Display error message
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No data available."), // Display no data message
            );
          } else {
            List<String>? breedList = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(20), // Add padding to the container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BreedDropdown(
                    breedList: breedList,
                    onChanged: (String? newValue) {
                      setState(() {});
                      breed = BreedDropdown.breed;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RandomImageBreed(breed: breed)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('Random Image'),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListImageBreed(breed: breed)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('List Image'),
                        ),
                      ),
                    ],
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
