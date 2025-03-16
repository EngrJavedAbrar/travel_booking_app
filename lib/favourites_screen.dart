import 'dart:ui';

import 'package:flutter/material.dart';

import 'destination.dart';
import 'destination_detail.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Destination> favorites = [
    Destination(
      name: "Paris",
      price: "\$500",
      imagePath: "paris_image.jpg",
      description: "Explore the beautiful city of Paris...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return _buildDestinationCard(context, favorites[index]);
        },
      ),
    );
  }

  Widget _buildDestinationCard(BuildContext context, Destination destination) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationDetailsScreen(destination: destination),
            ),
          );
        },
        child: Column(
          children: [
            Image.asset(
              "assets/${destination.imagePath}",
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    destination.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    destination.price,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}