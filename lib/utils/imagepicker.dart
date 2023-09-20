import 'dart:html';

import 'package:flutterclone/utils/storage.dart';
import 'package:image_picker/image_picker.dart';

IMGPicker(ImageSource source) async {
  final ImagePicker picker = ImagePicker();

  XFile? image = await picker.pickImage(source: source);

  if (image != null) {
    return image.readAsBytes();
  } else {
    print("No image selected");
  }
}
