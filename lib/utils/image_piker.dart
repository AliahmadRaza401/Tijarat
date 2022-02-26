import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGalleryOrCamera(context) async {
  return await showModalBottomSheet<File>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () async {
                    File? image = await _imgFromGallery();
                    Navigator.of(context).pop(image);
                  }),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () async {
                  File? image = await _imgFromCamera();
                  Navigator.of(context).pop(image);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<File?> _imgFromCamera() async {
  PickedFile? pickedFile = await ImagePicker.platform.pickImage(
    source: ImageSource.camera,
    imageQuality: 50,
  );

  if (pickedFile == null) return null;

  File image = File(pickedFile.path);
  return image;
}

Future<File?> _imgFromGallery() async {
  PickedFile? pickedFile = await ImagePicker.platform.pickImage(
    source: ImageSource.gallery,
    imageQuality: 50,
  );

  if (pickedFile == null) return null;

  File image = File(pickedFile.path);

  return image;
}
