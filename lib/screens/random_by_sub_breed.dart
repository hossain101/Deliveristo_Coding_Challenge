import 'package:flutter/material.dart';

import '../api/dog_api.dart';

class Random_By_SubBreed extends StatefulWidget {
  const Random_By_SubBreed({super.key});

  @override
  State<Random_By_SubBreed> createState() => _Random_By_SubBreedState();
}

class _Random_By_SubBreedState extends State<Random_By_SubBreed> {
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
