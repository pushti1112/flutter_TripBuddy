import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final int totalPlaces;

  const ProfileScreen({
    super.key,
    required this.totalPlaces,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Guest User",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.place),
                title: const Text("Places Added"),
                trailing: Text("$totalPlaces"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text("App Version"),
                trailing: const Text("1.0.0"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "TripBuddy helps you save and manage your favorite travel destinations.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}