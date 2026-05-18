import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 167, 205, 237), const Color.fromARGB(255, 238, 229, 240)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'App Version: 1.0.0',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
      
          SizedBox(height: 230),
          
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/TripBuddy_Logo.jpeg'),
          ),
          
          SizedBox(height: 20),

          Text(
            'Your Guide To Endless Journey...',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
      
          SizedBox(height: 250),
      
          CircularProgressIndicator(),
      
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Loading...", style: TextStyle(fontSize: 16)),
          ),
      
          SizedBox(height: 20),
          
          Spacer(),
      
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Copyright © 2026 TripBuddy. All rights reserved.",style: TextStyle(fontSize: 16),),
          ),
      
        ],
      ),
    );
  }
}