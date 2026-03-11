import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/features/orders/presentation/widgets/processing/processing_step_tile.dart';
import 'package:clean_go_vendor_app/core/widgets/app_bottom_nav.dart';
import 'package:clean_go_vendor_app/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  final List<String> steps = [
    "Received",
    "Wash",
    "Iron",
    "Dry Clean",
    "QC",
    "Packed",
    "Ready",
  ];

  int currentStepIndex = 4;
  bool showQcChecklist = false;

  StepStatus getStatus(int index) {
    if (index < currentStepIndex) {
      return StepStatus.completed;
    } else if (index == currentStepIndex) {
      return StepStatus.current;
    } else if (index == currentStepIndex + 1) {
      return StepStatus.pending;
    } else {
      return StepStatus.disabled;
    }
  }

  void moveToNextStage() {
    if (currentStepIndex < steps.length - 1) {
      setState(() {
        currentStepIndex++;

        if (currentStepIndex >= 4) {
          showQcChecklist = true;
        }
      });
    }
  }

  Widget qcItem(String text, bool completed) {
    const primaryColor = Color(0xff0B7A5E);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completed ? primaryColor : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: completed ? Colors.black : Colors.grey,
                decoration: completed ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff0B7A5E);

    bool isReadyStage = currentStepIndex == 6;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
        backgroundColor: Colors.white,
        elevation: 9,
        leadingWidth: 40,
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 2,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Processing • ORD-2026-001",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Sameer Vyas • 3 items",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryColor),
            ),
            child: const Center(
              child: Text(
                "01:57:22",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// -------- PROCESSING PIPELINE --------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Processing Pipeline",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),

                  for (int i = 0; i < steps.length; i++)
                    ProcessingStepTile(
                      title: steps[i],
                      status: getStatus(i),
                      isLast: i == steps.length - 1,
                      onMove: getStatus(i) == StepStatus.pending
                          ? moveToNextStage
                          : null,
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// -------- QC CHECKLIST --------
            if (showQcChecklist)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "QC Checklist",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          isReadyStage ? "6/6" : "0/6",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    qcItem("All items counted and matched", isReadyStage),
                    qcItem("Quality of wash/iron verified", isReadyStage),
                    qcItem("No remaining stains or damage", isReadyStage),
                    qcItem("Packaging is intact and sealed", isReadyStage),
                    qcItem("QR label attached correctly", isReadyStage),

                    if (isReadyStage) ...[
                      const SizedBox(height: 20),
                      InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          context.go('/home');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF148C81),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Mark Ready for Delivery",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

            /// -------- ORDER ITEMS --------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Items",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Shirt"), Text("x4")],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Trousers"), Text("x2")],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(currentIndex: 1),
    );
  }
}
