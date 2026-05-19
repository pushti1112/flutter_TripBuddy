import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/place_holder.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the next screen after the splash screen duration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PlaceHolder()), // Replace with your next screen
      );
    });
  }

  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        
        // gradient: LinearGradient(
        //   colors: [const Color.fromARGB(255, 167, 205, 237), const Color.fromARGB(255, 238, 229, 240)],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),

        image: DecorationImage(
          image: AssetImage('lib/assets/Splash_bg.jpeg'),
          fit: BoxFit.cover,
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      
          SizedBox(height: 310),
      
          CircularProgressIndicator(),
      
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Loading...", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
          ),
      
          SizedBox(height: 20),
          
          Spacer(),
      
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Copyright © 2026 TripBuddy. All rights reserved.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
      
        ],
      ),
    );
  }
  }
