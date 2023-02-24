import 'dart:async';
import 'dart:developer';

import 'package:camera_image/functions/camera_functions.dart';
import 'package:image_picker/image_picker.dart';

enum CameraAction { takePic, deletePic, sendPic, replacePic }

class CameraService {
  //This is for your need
  final imageCount;
  final _streamControllerList = StreamController<List<XFile>>.broadcast();
  StreamSink<List<XFile>> get _streamSinkList => _streamControllerList.sink;
  Stream<List<XFile>> get streamList => _streamControllerList.stream;

  final _streamControllerCamera = StreamController<CameraAction>.broadcast();
  StreamSink<CameraAction> get streamSinkCamera => _streamControllerCamera.sink;
  Stream<CameraAction> get _streamCamera => _streamControllerCamera.stream;

  CameraService({required this.imageCount}) {
    List<XFile> images = [];
    _streamCamera.listen((event) async {
      if (event == CameraAction.takePic) {
        if (images.length <= imageCount - 1) {
          XFile? picture = await CameraFunctions().takePicture();
          images.add(picture!);
          _streamSinkList.add(images);
        }
      } else if (event == CameraAction.sendPic) {
        ////Implement your sending code here and http requests
      } else if (event == CameraAction.deletePic) {
      } else if (event == CameraAction.replacePic) {}
    });
  }

  //This is for disposing for all streamControllers after using it
  void dispose() {
    _streamControllerCamera.close();
    _streamControllerList.close();
  }
}
