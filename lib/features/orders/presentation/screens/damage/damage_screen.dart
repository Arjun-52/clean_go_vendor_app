import 'dart:io';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/seal_screen.dart';

import 'package:clean_go_vendor_app/features/orders/presentation/widgets/common/step_indicator.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/widgets/damage/damage_image_box.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/widgets/damage/damage_chip.dart';

class DamageScreen extends StatefulWidget {
  const DamageScreen({super.key});

  @override
  State<DamageScreen> createState() => _DamageScreenState();
}

class _DamageScreenState extends State<DamageScreen> {
  File? damageImage;
  List<String> damages = [];

  final TextEditingController damageController = TextEditingController();

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        damageImage = File(pickedFile.path);
      });
    }
  }

  void removeImage() {
    setState(() {
      damageImage = null;
    });
  }

  @override
  void dispose() {
    damageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xff0C3C60);

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Pickup • CLN-2026-001",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              "Marco Jess",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          /// STEP INDICATOR
          StepIndicator(currentStep: 1),

          const SizedBox(height: 15),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Damage Tagging",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Report any existing damage.This is optional but recommended",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    /// IMAGE BOX
                    DamageImageBox(
                      image: damageImage,
                      onAdd: openCamera,
                      onRemove: removeImage,
                    ),

                    const SizedBox(height: 20),

                    /// INPUT ROW
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TextField(
                              controller: damageController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "eg. Stain on collar",
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        GestureDetector(
                          onTap: () {
                            final text = damageController.text.trim();

                            if (text.isNotEmpty) {
                              setState(() {
                                damages.add(text);
                                damageController.clear();
                              });
                            }
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.send, color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// DAMAGE CHIPS
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: damages.map((damage) {
                        return DamageChip(
                          damage: damage,
                          onRemove: () {
                            setState(() {
                              damages.remove(damage);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// NEXT BUTTON
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SealScreen()),
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
    );
  }
}
