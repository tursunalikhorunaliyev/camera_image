import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePathProvider extends ChangeNotifier {
  XFile? image;

  void takePic() async {
    final cameraPermission = await getCameraPermission();

    bool isOk = cameraPermission.isGranted;
    if (isOk) {
      final XFile? photo =
          await ImagePicker().pickImage(source: ImageSource.camera);
      image = photo;
      notifyListeners();
    }
  }

  void takePicWithoutPermission() async {
    final XFile? photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    image = photo;
    notifyListeners();
  }

  XFile? getImage() => image;
  Future<PermissionStatus> getCameraPermission() async {
    final permission = await Permission.camera;
    return permission.status;
  }

  Future<PermissionStatus> getStoreagePermission() async {
    final permission = await Permission.storage;
    return permission.status;
  }
}
