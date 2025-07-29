import 'dart:io';
import 'package:cowmaster/layouts/shimmer_image_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditableImagePicker extends StatefulWidget {
  final double? size;
  final String? initialImage;
  final Function(File file)? onChange;
  const EditableImagePicker({super.key, this.initialImage, this.onChange, this.size});

  @override
  State<EditableImagePicker> createState() => _EditableImagePickerState();
}

class _EditableImagePickerState extends State<EditableImagePicker> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Pick image from gallery
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
      widget.onChange?.call(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular((widget.size??150) / 2),
            child: Container(
              width: widget.size??150,
              height: widget.size??150,
              color: Colors.grey[300],
              child: _selectedImage != null ? Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
              ) : ShimmerImageView(
                width: widget.size??150,
                height: widget.size??150,
                imageUrl: widget.initialImage??"",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: _chooseImageSource,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _chooseImageSource() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a photo'),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}


