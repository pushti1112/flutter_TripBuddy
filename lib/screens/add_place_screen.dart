import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

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
  // File? selectedImage;
  XFile? selectedImage;
  final picker = ImagePicker();
  // final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Place')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TextField(
            //   controller: imageController,
            //   decoration: InputDecoration(
            //     labelText: 'Image URL',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),
            Column(
              children: [
                selectedImage != null
                    ? kIsWeb
                          ? Image.network(
                              selectedImage!.path,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(selectedImage!.path),
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                    : Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Icon(Icons.image, size: 100),
                      ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: pickImage, child: Text('Pick Image')),
              ],
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
                if (selectedImage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select an image')),
                  );
                  return;
                }

                final newPlace = {
                  "name": nameController.text,
                  "city": cityController.text,
                  "image": selectedImage?.path,
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
