import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_place_screen.dart';
import 'package:flutter_application_1/screens/detail_screen.dart';

class ListingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> places;
  final Function(Map<String, dynamic>) addPlace;
  final Function(int) deletePlace;
  String search = "";

  ListingScreen({
    super.key,
    required this.places,
    required this.addPlace,
    required this.deletePlace,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  AddPlaceScreen(places: places, addPlace: addPlace),
            ),
          );
        },

        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: double.infinity,

                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/listing_bg.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: double.infinity,
              ),

              Positioned(
                left: 20,
                top: 90,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Text(
                      "Trip Buddy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Make your trip easier with trip buddy!",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 40,
                right: 10,

                child: IconButton(
                  onPressed: () {},

                  icon: const Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Places",

                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: places.length,

              itemBuilder: (context, index) {
                final place = places[index];

                if (!place['name'].toLowerCase().contains(
                  search.toLowerCase(),
                )) {
                  return const SizedBox();
                }

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(place['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // DETAILS
                      Padding(
                        padding: const EdgeInsets.all(12),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              place['name'],

                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              place['city'],

                              style: TextStyle(color: Colors.grey.shade700),
                            ),

                            const SizedBox(height: 5),

                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            DetailScreen(place: place),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Discover",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                Spacer(),

                                IconButton(
                                  onPressed: () {
                                    // delete code here
                                    deletePlace(index);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Place Deleted"),
                                      ),
                                    );
                                  },

                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 205, 117, 237),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
