import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'destination.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;

  DestinationDetailsScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rounded Corner Image
            Hero(
              tag: "destination_${destination.name}",
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/${destination.imagePath}",
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // City Name and Price
                  Text(
                    destination.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Price: ${destination.price}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Point-wise Description
                  Text(
                    "About ${destination.name}:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ..._buildDescriptionPoints(destination.description),
                ],
              ),
            ),
          ],
        ),
      ),
      // Book Now Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle booking logic
            },
            child: Text(
              "Book Now for ${destination.price}",
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create point-wise description
  List<Widget> _buildDescriptionPoints(String description) {
    List<String> points = description.split(". "); // Split description into points
    return points.map((point) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("• ", style: TextStyle(fontSize: 16)), // Bullet point
            Expanded(
              child: Text(
                point,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}