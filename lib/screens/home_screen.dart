import 'package:deliveristo_coding_challenge/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: DashboardCard(
                    title: "Breed Only",
                    onTap: () {
                      Navigator.pushNamed(context, '/random_by_breed');
                    },
                    backgroundImage:
                        "https://images.dog.ceo/breeds/mountain-swiss/n02107574_854.jpg")),
            Expanded(
                child: DashboardCard(
                    title: "Sub-Breed",
                    onTap: () {
                      Navigator.pushNamed(context, '/random_by_subBreed');
                    },
                    backgroundImage:
                        "https://images.dog.ceo/breeds/hound-english/n02089973_4359.jpg")),
          ],
        ),
      ),
    );
  }
}
