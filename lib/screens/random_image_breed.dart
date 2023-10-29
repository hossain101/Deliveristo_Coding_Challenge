import 'package:flutter/material.dart';
import 'package:deliveristo_coding_challenge/api/dog_api.dart'; // Import your DogAPI class
import 'package:deliveristo_coding_challenge/models/dog.dart'; // Import your Dog model
import 'package:deliveristo_coding_challenge/widgets/breed_dropdown.dart'; // Import your BreedDropdown widget
import 'package:deliveristo_coding_challenge/widgets/sub_breed_dropdown.dart'; // Import your SubBreedDropdown widget

class RandomImageBreed extends StatelessWidget {
  final String breed;

  RandomImageBreed({super.key, required this.breed});

  Future<String> getDogImage() async {
    final response = await DogAPI.fetchRandomDogImageBreed(breed);
    return response['message'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed),
      ),
      body: FutureBuilder<String>(
        future: getDogImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No image available"));
          } else {
            return Container(
              child: Image.network(
                snapshot.data!,
                width: 300,
                height: 300,
              ),
            );
          }
        },
      ),
    );
  }
}
