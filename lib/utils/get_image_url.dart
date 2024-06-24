import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageUrl(String imgUrl) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference imageRef = storage.ref().child(imgUrl);
  String imageUrl = await imageRef.getDownloadURL();
  return imageUrl;
}