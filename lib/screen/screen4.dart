import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({Key? key}) : super(key: key);

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  File? img;

  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(
          () {
            img = File(image.path);
          },
        );
      } else {
        return;
      }
    } catch (e) {
      debugPrint("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://thumbs.dreamstime.com/b/education-people-school-logo-design-template-education-people-school-logo-design-template-117344868.jpg",
            width: 200,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _loadImage(ImageSource.camera);
                },
                child: const Text("Open Camera"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Open Gallary"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
