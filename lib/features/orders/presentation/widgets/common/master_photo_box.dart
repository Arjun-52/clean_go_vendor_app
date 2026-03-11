import 'dart:io';
import 'package:flutter/material.dart';

class MasterPhotoBox extends StatelessWidget {
  final File? photo;
  final VoidCallback onTap;

  const MasterPhotoBox({super.key, required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt_outlined, size: 30),
                SizedBox(height: 5),
                Text("Add"),
              ],
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        photo!,
        height: 140,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
