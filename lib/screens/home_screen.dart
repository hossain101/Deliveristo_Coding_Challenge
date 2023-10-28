import 'package:deliveristo_coding_challenge/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: Container(
        color: Colors.black54,
        child: Column(
          //change the background color to blue


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(child: DashboardCard(title: "Random Image by Breed Only",
                onTap: (){
                  Navigator.pushNamed(context, '/random_by_breed');
                },
                backgroundImage: "https://images.dog.ceo/breeds/cotondetulear/IMG_20160830_202631573.jpg")),


            Expanded(child: DashboardCard(title: "Random Image by Sub-Breed", onTap: (){ Navigator.pushNamed(context, '/random_by_subBreed');}, backgroundImage: "https://images.dog.ceo/breeds/pointer-german/n02100236_4657.jpg")),


            Expanded(child: DashboardCard(title: "Dog Images List by Breed", onTap: (){ Navigator.pushNamed(context, '/list_by_breed');}, backgroundImage: "https://images.dog.ceo/breeds/dachshund/Stretched_Dachshund.jpg")),


            Expanded(child: DashboardCard(title: "Dog Images List by Sub-Breed", onTap: (){ Navigator.pushNamed(context, '/list_by_subBreed');}, backgroundImage: "https://images.dog.ceo/breeds/shiba/kurosuke01.jpg")),

          ],
        ),
      ),
    );
  }
}
