import 'dart:developer';
import 'dart:io';

import 'package:camera_image/providers/image_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await ImagePicker().retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      log("yo'qolgan malumotlar topildi");
    } else {
      log("yo'qolgan ma'lumot topilmadi");
    }
  }

  @override
  Widget build(BuildContext context) {
    final imagePathProvider = Provider.of<ImagePathProvider>(context);
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () async {
          imagePathProvider.takePicWithoutPermission();
        },
        child: Container(
          width: 200,
          height: 200,
          decoration:
              const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
          child: imagePathProvider.getImage() != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    File(imagePathProvider.getImage()!.path),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    ));
  }
}
