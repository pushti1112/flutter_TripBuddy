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
      "image": "https://images.unsplash.com/photo-1564507592333-c60657eea523",
      "description":
          "The Taj Mahal is one of the most famous monuments in the world and a symbol of love. "
          "It is located in Agra, India, and was built by the Mughal emperor Shah Jahan "
          "in memory of his wife Mumtaz Mahal. "
          "Made from beautiful white marble, the Taj Mahal is known for its stunning architecture, "
          "gardens, and historical importance. "
          "Millions of tourists visit this wonderful place every year to enjoy its beauty "
          "and learn about its rich history.",
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
    return ListingScreen(
      places: places,
      addPlace: addPlace,
      deletePlace: deletePlace,
    );
  }
}
