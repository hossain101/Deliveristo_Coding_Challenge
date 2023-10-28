import "package:flutter/material.dart";

import "../api/dog_api.dart";
import "../widgets/sub_breed_dropdown.dart";

class RandomImageSubBreed extends StatelessWidget {
  final String breed;
  final String subBreed;

  RandomImageSubBreed({super.key, required this.breed, required this.subBreed});

  Future<String> getDogImage() async {
    final response = await DogAPI.fetchRandomDogImageSubBreed(breed, subBreed);
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
