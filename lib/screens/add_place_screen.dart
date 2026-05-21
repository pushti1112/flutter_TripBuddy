import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  final List<Map<String, dynamic>> places;
  final Function(Map<String, dynamic>) addPlace;

  const AddPlaceScreen({
    super.key,
    required this.places,
    required this.addPlace,
  });

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Place')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: imageController,
              decoration: InputDecoration(
                labelText: 'Image URL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Place Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final newPlace = {
                  "name": nameController.text,
                  "city": cityController.text,
                  "image": imageController.text,
                  "description": descriptionController.text,
                };

                widget.addPlace(newPlace);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Place Added")));

                Navigator.pop(context);
              },
              child: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
