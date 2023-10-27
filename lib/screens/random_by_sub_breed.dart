import 'package:flutter/material.dart';

import '../api/dog_api.dart';

class RandomSubBreed extends StatefulWidget {
  const RandomSubBreed({super.key});

  @override
  State<RandomSubBreed> createState() => _RandomSubBreedState();
}

class _RandomSubBreedState extends State<RandomSubBreed> {
  String breed = "bulldog";
  String subBreed = "french";
  String imageURL = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async{
                final jsonData = await DogAPI.fetchRandomDogImageSubBreed(breed, subBreed);

                imageURL = jsonData['message'];
                setState(() {});



              },
              child: const Text('Random Sub Breed'),
            ),

          ),
          if(imageURL.isNotEmpty)

          Container(
            child: Image.network(imageURL,
            width: 300,
            height: 300,),
          ),
        ],
      ),


    );
  }
}
