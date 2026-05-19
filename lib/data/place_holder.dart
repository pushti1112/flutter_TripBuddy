import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/listing_screen.dart';

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
      "image": "https://images.unsplash.com/photo-1511739001486-6bfe10ce785f",
      "description": "Beautiful place in Paris.",
    },

    {
      "name": "Taj Mahal",
      "city": "Agra",
      "image": "https://images.unsplash.com/photo-1564507592333-c60657eea523",
      "description": "One of the seven wonders.",
    },
  ];

  void addPlace(Map<String, dynamic> newPlace) {
    setState(() {
      places.add(newPlace);
    });
  }

  void deletePlace(int index) {
    setState(() {
      places.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListingScreen(places: places,addPlace: addPlace, deletePlace: deletePlace);
  }
}
