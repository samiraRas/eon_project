import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
 class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  
  final imagePicker = ImagePicker();
  Future getImage() async{
    final image = await imagePicker.pickImage(source: ImageSource.camera);
          if (image != null) {
              setState(() {
               _image = File(image.path);
                });
              }
          }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: SafeArea(
        child:Center(
          child: _image == null? Text("No Image Selected") : Image.file(_image!),
        )),
             floatingActionButton: FloatingActionButton( 
             onPressed: getImage, 
             child: Icon(Icons.camera_alt),
             ),
     

    );
  }
}