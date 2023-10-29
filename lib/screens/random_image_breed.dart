import 'package:flutter/material.dart';
import 'package:deliveristo_coding_challenge/api/dog_api.dart';

class RandomImageBreed extends StatelessWidget {
  final String breed;

  const RandomImageBreed({super.key, required this.breed});

  Future<String> getDogImage() async {
    final response = await DogAPI.fetchRandomDogImageBreed(breed);
    return response['message'] as String;
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
      body: FutureBuilder<String>(
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://img.freepik.com/free-vector/gradient-minimalist-background_23-2150012317.jpg?w=1380&t=st=1698556077~exp=1698556677~hmac=649fe511dbbbc20d7fb897f14c79e7c00020d37cc14ada97df7dec69c8cda10c"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.network(
                  snapshot.data!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
