import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> adduser(String? uid, String name) {
  final user = {
    'name': name,
  };
  return FirebaseFirestore.instance.collection('Users').doc(uid).set(user);
}
