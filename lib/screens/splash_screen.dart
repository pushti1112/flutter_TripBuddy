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
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PlaceHolder(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Container(

          width: double.infinity,

          decoration: const BoxDecoration(

            image: DecorationImage(
              image: AssetImage(
                'lib/assets/Splash_bg.jpeg',
              ),

              fit: BoxFit.cover,
            ),
          ),

          child: Column(

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: const [

                  Padding(
                    padding: EdgeInsets.all(8.0),

                    child: Text(
                      'App Version: 1.0.0',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              
              const Spacer(),

              
              const CircleAvatar(

                radius: 50,

                backgroundImage: AssetImage(
                  'lib/assets/TripBuddy_Logo.jpeg',
                ),
              ),

              const SizedBox(height: 20),

              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),

                child: Text(
                  'Your Guide To Endless Journey...',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              
              const Spacer(),

             
              const CircularProgressIndicator(),

              const SizedBox(height: 15),

              const Text(

                "Loading...",

                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Padding(
                padding: EdgeInsets.all(16.0),

                child: Text(
                  "Copyright © 2026 TripBuddy. All rights reserved.",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}