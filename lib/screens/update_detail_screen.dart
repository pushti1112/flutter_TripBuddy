import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class UpdateDetailScreen extends StatefulWidget {
  final Map<String, dynamic> place;
  final int index;
  final Function(int, Map<String, dynamic>) updatePlace;

  const UpdateDetailScreen({
    super.key,
    required this.place,
    required this.index,
    required this.updatePlace,
  });

  @override
  State<UpdateDetailScreen> createState() => _UpdateDetailScreenState();
}

class _UpdateDetailScreenState extends State<UpdateDetailScreen> {
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

  buildPlaceImage(String imagePath) {
    if (imagePath.toString().startsWith('lib/assets/')) {
      return Image.asset(
        imagePath,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return kIsWeb
          ? Image.network(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Image.file(
              File(imagePath),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            );
    }
  }
  @override
  void initState() {
    super.initState();

    // imageController.text = widget.place['image'];
    nameController.text = widget.place['name'];
    cityController.text = widget.place['city'];
    descriptionController.text = widget.place['description'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Place')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
    ? buildPlaceImage(selectedImage!.path)
    : buildPlaceImage(widget.place['image']),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: pickImage,
                    child: const Text("Change Image"),
                  ),
                ],
              ),

              SizedBox(height: 30),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Place Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: 30),

              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'City Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: 30),

              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  final updatedPlace = {
                    'image': selectedImage?.path ?? widget.place['image'],
                    'name': nameController.text,
                    'city': cityController.text,
                    'description': descriptionController.text,
                  };

                  widget.updatePlace(widget.index, updatedPlace);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(" Place Updated")),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Update Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
