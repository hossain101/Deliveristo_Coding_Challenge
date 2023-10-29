import "package:flutter/material.dart";

import "../api/dog_api.dart";

class RandomImageSubBreed extends StatelessWidget {
  final String breed;
  final String subBreed;

  const RandomImageSubBreed(
      {super.key, required this.breed, required this.subBreed});

  Future<String> getDogImage() async {
    if (subBreed.isEmpty) {
      final response = await DogAPI.fetchRandomDogImageBreed(breed);
      return response['message'] as String;
    } else {
      final response =
          await DogAPI.fetchRandomDogImageSubBreed(breed, subBreed);
      return response['message'] as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/free-vector/gradient-minimalist-background_23-2150012317.jpg?w=1380&t=st=1698556077~exp=1698556677~hmac=649fe511dbbbc20d7fb897f14c79e7c00020d37cc14ada97df7dec69c8cda10c"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FutureBuilder<String>(
            future: getDogImage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No image available"));
              } else {
                return Container(
                  child: Image.network(
                    snapshot.data!,
                  ),
                  width: 400,
                  height: 500,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
