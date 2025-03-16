import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'destination.dart';
import 'destination_detail.dart';

class HomeScreen extends StatelessWidget {
  final List<Destination> destinations = [
    Destination(
      name: "Paris",
      price: "\$500",
      imagePath: "paris.jpg",
      description: "Explore the beautiful city of Paris...",
    ),
    Destination(
      name: "Tokyo",
      price: "\$700",
      imagePath: "tokyo.jpg",
      description: "Discover the vibrant culture of Tokyo...",
    ),
    Destination(
      name: "New York",
      price: "\$600",
      imagePath: "new_york.jpg",
      description: "Experience the bustling streets of New York...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Booking App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search destinations...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),

              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                return _buildDestinationCard(context, destinations[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
            Hero(
              tag: "destination_${destination.name}",
              child: Image.asset(
                "assets/${destination.imagePath}",
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
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

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        // Handle tab changes
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Bookings",
        ),
      ],
    );
  }
}