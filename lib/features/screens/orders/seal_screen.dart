import 'package:flutter/material.dart';
import 'pickup_otp_screen.dart';
import 'package:clean_go_vendor_app/widgets/step_indicator.dart';
import 'package:clean_go_vendor_app/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/widgets/item_summary_card.dart';

class SealScreen extends StatefulWidget {
  const SealScreen({super.key});

  @override
  State<SealScreen> createState() => _SealScreenState();
}

class _SealScreenState extends State<SealScreen> {
  bool isSealed = false;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0D3B66);

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pickup • ORD-2026-001",
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

          const StepIndicator(),

          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  /// QR + Seal Card
                  Container(
                    padding: const EdgeInsets.all(18),
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
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          color: Colors.black,
                          child: const Center(
                            child: Icon(
                              Icons.qr_code,
                              color: Colors.white,
                              size: 90,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          "Packet Sealing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "QR: ORD-2026-001",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Seal all items in the packet and attach the QR label.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSealed
                                  ? const Color(0xFF5A7F99)
                                  : primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isSealed = true;
                              });
                            },
                            icon: Icon(
                              isSealed
                                  ? Icons.check_circle_outline
                                  : Icons.inventory_2_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              isSealed
                                  ? "Sealed & QR Attached"
                                  : "Confirm Packed Sealed",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  const ItemSummaryCard(),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSealed
                            ? primary
                            : const Color(0xFF5A7F99),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: isSealed
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PickupOtpScreen(),
                                ),
                              );
                            }
                          : null,
                      child: const Text(
                        "Proceed to OTP",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}
