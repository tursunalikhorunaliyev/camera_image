import 'package:image_picker/image_picker.dart';

class CameraFunctions {
  Future<XFile?> takePicture() async {
    final XFile? photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    return photo;
  }
}
