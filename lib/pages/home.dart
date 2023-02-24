import 'package:camera_image/services/camera_service.dart';
import 'package:camera_image/widgets/picture_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cameraService = CameraService(imageCount: 2);
  @override
  void dispose() {
    cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StreamBuilder<List<XFile>>(
                    stream: cameraService.streamList,
                    builder: (context, snapshot) {
                      return PictureCard(
                          imagePath: snapshot.hasData
                              ? snapshot.data!.isNotEmpty
                                  ? snapshot.data![0].path
                                  : ""
                              : "",
                          onTap: () => _onTapCard(CameraAction.takePic));
                    }),
                StreamBuilder<List<XFile>>(
                    stream: cameraService.streamList,
                    builder: (context, snapshot) {
                      return PictureCard(
                          imagePath: snapshot.hasData
                              ? snapshot.data!.length >= 2
                                  ? snapshot.data![1].path
                                  : ""
                              : "",
                          onTap: () => _onTapCard(CameraAction.takePic));
                    }),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _onTapCard(CameraAction.sendPic),
              child: Container(
                width: 370,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapCard(CameraAction action) {
    switch (action) {
      case CameraAction.takePic:
        cameraService.streamSinkCamera.add(action);
        break;
      case CameraAction.sendPic:
        break;
      case CameraAction.deletePic:
        break;
      default:
    }
  }
}
