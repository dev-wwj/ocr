import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          IconButton(
              onPressed: () {
                _photoPicker(ImageSource.gallery, context: context);
              }, icon: const Icon(Icons.photo_library_outlined))
        ],
      ),
      body: const SafeArea(
        child: Text(
          'Body',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }


  XFile? _selectedFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> _photoPicker(ImageSource source,
      {required BuildContext context,
      bool isMultiImage = false,
      bool isMedia = false}) async {
    XFile? picked = await _picker.pickImage(source: source);
    _selectedFile = picked;
    _ocr();
    setState(() {
    });
  }
  
  Future<void> _ocr() async {
    var path = _selectedFile?.path;
    if (path != null) {

    }
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality, int? limit);



