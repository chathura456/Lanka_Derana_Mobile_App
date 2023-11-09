import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage, required this.labelName});

  final void Function(File image) onPickImage;
  final String labelName;

  @override
  State<StatefulWidget> createState() {
    return _ImageInput();
  }
}

class _ImageInput extends State<ImageInput> {
  File? _selectedImage;

  final ImagePicker picker = ImagePicker();

  void _takePictures() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImage!);
  }

  /// Get from gallery
  _getFromGallery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    final List<XFile> images = await picker.pickMultiImage();

    if (image == null) {
      return;
    }
    setState(() {
      _selectedImage = File(image.path);
    });
    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _getFromGallery,
      icon: const Icon(Icons.camera),
      label: Text(widget.labelName),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _getFromGallery,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      alignment: Alignment.center,
      child: content,
    );
  }
}
