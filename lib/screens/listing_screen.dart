import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
// import 'package:flutter_application_1/screens/add_place_screen.dart';
// import 'package:flutter_application_1/screens/detail_screen.dart';
// import 'package:flutter_application_1/screens/update_detail_screen.dart';

class ListingScreen extends StatefulWidget {
  final List<Map<String, dynamic>> places;
  final Function(Map<String, dynamic>) addPlace;
  final Function(int) deletePlace;
  final Function(int, Map<String, dynamic>) updatePlace;

  const ListingScreen({
    super.key,
    required this.places,
    required this.addPlace,
    required this.deletePlace,
    required this.updatePlace,
  });

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,

        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => AddPlaceScreen(
          //       places: widget.places,
          //       addPlace: widget.addPlace,
          //     ),
          //   ),
          // );

          Navigator.pushNamed(
            context,
            "/addPlace",
            arguments: {"places": widget.places, "addPlace": widget.addPlace},
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
                      "Capture Every moment of your Journey",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 40,
                right: 10,

                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/profile");
                  },

                  icon: const Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },

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

              itemCount: widget.places.length,

              itemBuilder: (context, index) {
                final place = widget.places[index];

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
                            image:
                                place['image'].toString().startsWith(
                                  'lib/assets/',
                                )
                                ? AssetImage(place['image'])
                                // : FileImage(File(place['image']))
                                //       as ImageProvider,
                                : kIsWeb
                                ? NetworkImage(place['image']) 
                                : FileImage(File(place['image']))
                                      as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

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
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (_) =>
                                    //         DetailScreen(place: place),
                                    //   ),
                                    // );

                                    Navigator.pushNamed(
                                      context,
                                      "/detail",
                                      arguments: place,
                                    );
                                  },

                                  child: const Text(
                                    "Discover",

                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                const Spacer(),

                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,

                                    //   MaterialPageRoute(
                                    //     builder: (_) => UpdateDetailScreen(
                                    //       place: place,
                                    //       index: index,
                                    //       updatePlace: widget.updatePlace,
                                    //     ),
                                    //   ),
                                    // );

                                    Navigator.pushNamed(
                                      context,
                                      "/update",

                                      arguments: {
                                        "place": place,
                                        "index": index,
                                      },
                                    );
                                  },

                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 205, 117, 237),
                                  ),
                                ),

                                // IconButton(
                                //   onPressed: () {
                                //     widget.deletePlace(index);

                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //         content: Text("Place Deleted"),
                                //       ),
                                //     );
                                //   },

                                //   icon: const Icon(
                                //     Icons.delete,
                                //     color: Color.fromARGB(255, 205, 117, 237),
                                //   ),
                                // ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,

                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Delete Place"),

                                          content: const Text(
                                            "Are you sure you want to delete this place?",
                                          ),

                                          actions: [
                                            // Cancel Button
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },

                                              child: const Text("Cancel"),
                                            ),

                                            // Delete Button
                                            TextButton(
                                              onPressed: () {
                                                widget.deletePlace(index);

                                                Navigator.pop(context);

                                                ScaffoldMessenger.of(
                                                  this.context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      "Place Deleted",
                                                    ),
                                                  ),
                                                );
                                              },

                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
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
