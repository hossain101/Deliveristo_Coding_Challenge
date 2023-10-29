import 'package:flutter/material.dart';

import '../api/dog_api.dart';

class ListImageSubBreed extends StatelessWidget {
  final String breed;
  final String subBreed;

  const ListImageSubBreed(
      {super.key, required this.breed, required this.subBreed});

  Future<List<String>> getDogImage() async {
    if (subBreed.isEmpty) {
      return DogAPI.fetchDogImagesListByBreed(breed);
    } else {
      return DogAPI.fetchDogImagesListBySubBreed(breed, subBreed);
    }
  }

  Future<List<String>> getDogImages() async {
    return DogAPI.fetchDogImagesListBySubBreed(breed, subBreed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$breed - $subBreed"),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: FutureBuilder<List<String>>(
        future: getDogImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No images available"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageUrl = snapshot.data![index];
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/gradient-minimalist-background_23-2150012317.jpg?w=1380&t=st=1698556077~exp=1698556677~hmac=649fe511dbbbc20d7fb897f14c79e7c00020d37cc14ada97df7dec69c8cda10c"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Image ${index + 1}',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ), // Display the image number
                      Image.network(imageUrl), // Display the image
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
