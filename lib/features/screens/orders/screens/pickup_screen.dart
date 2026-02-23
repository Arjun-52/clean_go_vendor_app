import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/step_indicator.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/photo_section.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/item_photo_grid.dart';
import 'package:clean_go_vendor_app/features/screens/orders/widegts/master_photo_box.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'damage_screen.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  File? masterPhoto;
  List<File> itemPhotos = [];

  Future<void> openMasterCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        masterPhoto = File(pickedFile.path);
      });
    }
  }

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        itemPhotos.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Pickup • CLN-2026-001",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          const StepIndicator(),

          const SizedBox(height: 15),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PhotoSection(
                    title: "Item Photos",
                    subtitle:
                        "Take category-wise photos of all items.\nMinimum 1 photo required.",
                    footerText: "${itemPhotos.length} photo(s) captured",
                    child: ItemPhotoGrid(
                      photos: itemPhotos,
                      onAdd: openCamera,
                      onRemove: (photo) {
                        setState(() {
                          itemPhotos.remove(photo);
                        });
                      },
                    ),
                  ),

                  PhotoSection(
                    title: "Master Photos",
                    subtitle:
                        "Take one master photo showing all items together.",
                    footerText: masterPhoto == null
                        ? "0 photo(s) captured"
                        : "1 photo(s) captured",
                    child: MasterPhotoBox(
                      photo: masterPhoto,
                      onTap: openMasterCamera,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0C3C60),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DamageScreen()),
                );
              },
              child: const Text(
                "Next Step",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}
