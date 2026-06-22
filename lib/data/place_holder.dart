import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_application_1/screens/listing_screen.dart';
import 'package:flutter_application_1/screens/add_place_screen.dart';
import 'package:flutter_application_1/screens/detail_screen.dart';
import 'package:flutter_application_1/screens/update_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';

class PlaceHolder extends StatefulWidget {
  const PlaceHolder({super.key});

  @override
  State<PlaceHolder> createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  List<Map<String, dynamic>> places = [
    {
      "name": "Eiffel Tower",
      "city": "Paris",
      "image": "lib/assets/Eiffel_Tower.jpeg",
      "description":
          "The Eiffel Tower is one of the most famous landmarks in the world. "
          "It is located in Paris, France, and was built in 1889. "
          "The tower was designed by Gustave Eiffel and attracts millions of visitors every year. "
          "People visit this beautiful place to enjoy the amazing city view, take photographs, "
          "and experience the culture of Paris. "
          "At night, the Eiffel Tower lights up and looks stunning. "
          "It is considered a symbol of love, beauty, and architecture.",
    },

    {
      "name": "Taj Mahal",
      "city": "Agra",
      "image": "lib/assets/Taj_Mahal.jpeg",
      "description":
          "The Taj Mahal is one of the most famous monuments in the world and a symbol of love. "
          "It is located in Agra, India, and was built by the Mughal emperor Shah Jahan "
          "in memory of his wife Mumtaz Mahal. "
          "Made from beautiful white marble, the Taj Mahal is known for its stunning architecture, "
          "gardens, and historical importance. "
          "Millions of tourists visit this wonderful place every year to enjoy its beauty "
          "and learn about its rich history.",
    },

    {
      "name": "India Gate",
      "city": "New Delhi",
      "image": "lib/assets/India_Gate.jpeg",
      "description":
          "India Gate is one of the most famous monuments in India and a symbol of bravery. "
          "It is located in New Delhi and was built in memory of Indian soldiers who died in World War I. "
          "Designed by Sir Edwin Lutyens, the monument is known for its beautiful architecture and historical importance. "
          "The Amar Jawan Jyoti beneath the arch honors the unknown soldiers of India. "
          "Thousands of tourists visit this wonderful place every year to enjoy its beauty and peaceful surroundings.",
    },
  ];

  void addPlace(Map<String, dynamic> newPlace) {
    setState(() {
      places.add(newPlace);
    });
    saveList();
  }

  void deletePlace(int index) {
    setState(() {
      places.removeAt(index);
    });
    saveList();
  }

  void updatePlace(int index, Map<String, dynamic> updatedPlace) {
    setState(() {
      places[index] = updatedPlace;
    });
    saveList();
  }

  Future<void> saveList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String jsonString = jsonEncode(
        places.map((item) {
          return {
            "name": item["name"],
            "city": item["city"],
            "image": item["image"],
            "description": item["description"],
          };
        }).toList(),
      );

      await prefs.setString("places_key", jsonString);

      print("List Successfully Saved");
    } catch (e) {
      print(e);
    }
  }

  void loadList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String? jsonString = prefs.getString("places_key");

      if (jsonString != null) {
        List<dynamic> jsonList = jsonDecode(jsonString);

        setState(() {
          places = jsonList.map((item) {
            return {
              "name": item["name"],
              "city": item["city"],
              "image": item["image"],
              "description": item["description"],
            };
          }).toList();
        });

        print("List Successfully Loaded");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    loadList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/",

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
              builder: (_) => ListingScreen(
                places: places,
                addPlace: addPlace,
                deletePlace: deletePlace,
                updatePlace: updatePlace,
              ),
            );

          case "/addPlace":
            return MaterialPageRoute(
              builder: (_) =>
                  AddPlaceScreen(places: places, addPlace: addPlace),
            );

          case "/detail":
            final place = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(
              builder: (_) => DetailScreen(place: place),
            );

          case "/update":
            final data = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(
              builder: (_) => UpdateDetailScreen(
                place: data['place'],
                index: data['index'],
                updatePlace: updatePlace,
              ),
            );

          case "/profile":
            return MaterialPageRoute(
              builder: (_) => ProfileScreen(totalPlaces: places.length),
            );

          default:
            return MaterialPageRoute(
              builder: (_) =>
                  const Scaffold(body: Center(child: Text("Route Not Found"))),
            );
        }
      },
    );
  }
}
