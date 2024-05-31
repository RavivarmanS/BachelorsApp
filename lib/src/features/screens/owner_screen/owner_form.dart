import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OwnerForm extends StatelessWidget {
  const OwnerForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HouseInfoForm(),
    );
  }
}

class HouseInfoForm extends StatefulWidget {
  @override
  _HouseInfoFormState createState() => _HouseInfoFormState();
}

class _HouseInfoFormState extends State<HouseInfoForm> {
  List<XFile> _houseImages = [];

  final _formKey = GlobalKey<FormState>();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bhkController = TextEditingController();
  TextEditingController _rentController = TextEditingController();
  TextEditingController _advanceController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _houseController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  bool _bikeParking = false;
  bool _carParking = false;
  bool _noParking = false;
  double _uploadProgress = 0.0;

  Future<void> _pickImage(List<XFile> images) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(pickedFile);
      });
    }
  }

  Future<List<String>> _uploadImages() async {
    List<String> downloadUrls = [];
    int totalFiles = _houseImages.length;
    int filesUploaded = 0;

    for (var imageList in [_houseImages]) {
      for (var image in imageList) {
        File file = File(image.path);
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('house_images/${image.name}');
        firebase_storage.UploadTask task = ref.putFile(file);

        // Listen to the task stream to update progress
        task.snapshotEvents.listen((firebase_storage.TaskSnapshot snapshot) {
          double progress = (snapshot.bytesTransferred / snapshot.totalBytes);
          setState(() {
            _uploadProgress = (filesUploaded / totalFiles) + (progress / totalFiles);
          });
        });

        // Wait for the upload to complete
        await task;

        String downloadURL = await ref.getDownloadURL();
        downloadUrls.add(downloadURL);
        filesUploaded++;
      }
    }
    return downloadUrls;
  }

  void _resetForm() {
    _houseController.clear();
    _addressController.clear();
    _bhkController.clear();
    _rentController.clear();
    _advanceController.clear();
    _phoneController.clear();
    _locationController.clear();
    setState(() {
      _houseImages.clear();
    });
    _bikeParking=false;
    _carParking=false;
    _noParking=false;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Get the current user ID
        String currentUserId = FirebaseAuth.instance.currentUser!.uid;

        // Reset upload progress
        setState(() {
          _uploadProgress = 0.0;
        });

        // Upload images to Firebase Storage and get download URLs
        List<String> downloadUrls = await _uploadImages();

        // Create a map of the data to be saved
        Map<String, dynamic> data = {
          'houseName': _houseController.text,
          'address': _addressController.text,
          'bhk': _bhkController.text,
          'location': _locationController.text,
          'bikeParking': _bikeParking,
          'carParking': _carParking,
          'noParking': _noParking,
          'rentAmount': _rentController.text,
          'advanceAmount': _advanceController.text,
          'phoneNumber': _phoneController.text,
          'houseImages': downloadUrls, // Store list of image URLs
          'ownerId': currentUserId, // Include the current user ID
        };

        // Add the data to Firestore
        await FirebaseFirestore.instance.collection('houses').add(data);

        // Show success message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('House information added to Firestore'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetForm(); // Call the method to reset the form
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        // Show error message if something goes wrong
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred: $e'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House Information Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _houseController,
                decoration: InputDecoration(labelText: 'House Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bhkController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'BHK'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the BHK';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: Text('Bike Parking'),
                value: _bikeParking,
                onChanged: (value) {
                  setState(() {
                    _bikeParking = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Car Parking'),
                value: _carParking,
                onChanged: (value) {
                  setState(() {
                    _carParking = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('No Parking'),
                value: _noParking,
                onChanged: (value) {
                  setState(() {
                    _noParking = value!;
                  });
                },
              ),
              TextFormField(
                controller: _rentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Rent Amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rent amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _advanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Advance Amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the advance amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildImagePickerButton('House', _houseImages),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePickerButton(String sectionName, List<XFile> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '$sectionName Images (${images.length}):',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () => _pickImage(images),
          child: Text('Add Image'),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.file(
              File(images[index].path),
              fit: BoxFit.cover,
            );
          },
        ),
      ],
    );
  }
}
