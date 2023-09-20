import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> uploadImage(
      {required String childname,
      required bool isPost,
      required Uint8List file}) async {
    Reference ref = storage.ref().child(childname).child(auth.currentUser!.uid);

    UploadTask task = ref.putData(file);
    await task;
    String url = await ref.getDownloadURL();
    return url;
  }
}
