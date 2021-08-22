import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera_demo/screens/preview_screen.dart';

class CapturesScreen extends StatelessWidget {
  final List<File> imageFileList;

  const CapturesScreen({required this.imageFileList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          for (File imageFile in imageFileList)
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        imageFileList: imageFileList,
                        imageFile: imageFile,
                      ),
                    ),
                  );
                },
                child: Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
