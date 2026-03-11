import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/screens/delivery/delivery_otp_screen.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';

class DeliveryChecklistScreen extends StatefulWidget {
  const DeliveryChecklistScreen({super.key});

  @override
  State<DeliveryChecklistScreen> createState() =>
      _DeliveryChecklistScreenState();
}

class _DeliveryChecklistScreenState extends State<DeliveryChecklistScreen> {
  bool shirtChecked = true;
  bool trousersChecked = false;
  bool partialDelivery = true;

  @override
  Widget build(BuildContext context) {
    color:
    AppColors.primary;
    const warningColor = Color(0xFFB78103);

    int checkedCount = (shirtChecked ? 1 : 0) + (trousersChecked ? 1 : 0);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery • ORD-2026-001",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Aday Sharma",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 1.5),
            ),
            child: const Text(
              "00:57:02",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// -------- ITEM CHECKLIST --------
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    /// HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.inventory_2, color: Color(0xFF0D3B66)),
                            SizedBox(width: 10),
                            Text(
                              "Item Checklist",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "$checkedCount/2",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// SHIRT ITEM
                    Row(
                      children: [
                        Checkbox(
                          value: shirtChecked,
                          shape: const CircleBorder(),
                          activeColor: const Color(0xFF148C81),
                          onChanged: (value) {
                            setState(() {
                              shirtChecked = value!;
                            });
                          },
                        ),

                        const SizedBox(width: 8),

                        const Expanded(
                          child: Text(
                            "Shirt",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Text(
                          "x4",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// TROUSERS ITEM
                    Row(
                      children: [
                        Checkbox(
                          value: trousersChecked,
                          shape: const CircleBorder(),
                          activeColor: const Color(0xFF148C81),
                          onChanged: (value) {
                            setState(() {
                              trousersChecked = value!;
                            });
                          },
                        ),

                        const SizedBox(width: 8),

                        const Expanded(
                          child: Text(
                            "Trousers",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Text(
                          "x2",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// -------- PARTIAL DELIVERY --------
              if (checkedCount < 2) ...[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F1E6),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFB78103)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.warning, color: Color(0xFFB78103)),
                          SizedBox(width: 10),
                          Text(
                            "Partial Delivery?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFB78103),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Some items are unchecked. This will create a sub-SLA for remaining items.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: partialDelivery,
                            activeColor: const Color(0xFF0D3B66),
                            onChanged: (value) {
                              setState(() {
                                partialDelivery = true;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Confirm partial delivery",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D3B66),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryOtpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Proceed (Partial)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],

              /// -------- FULL PROCEED BUTTON --------
              if (checkedCount == 2) ...[
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D3B66),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Proceed",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),

      bottomNavigationBar: AppBottomNav(currentIndex: 2),
    );
  }
}
