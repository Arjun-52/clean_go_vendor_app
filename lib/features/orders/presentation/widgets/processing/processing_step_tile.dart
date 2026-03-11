import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum StepStatus { completed, current, pending, disabled }

class ProcessingStepTile extends StatelessWidget {
  final String title;
  final StepStatus status;
  final bool isLast;
  final VoidCallback? onMove;

  const ProcessingStepTile({
    super.key,
    required this.title,
    required this.status,
    required this.isLast,
    this.onMove,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff0B7A5E);

    Color circleColor;
    IconData? icon;

    switch (status) {
      case StepStatus.completed:
        circleColor = primaryColor;
        icon = Icons.check;
        break;
      case StepStatus.current:
        circleColor = primaryColor;
        icon = Icons.local_laundry_service;
        break;
      case StepStatus.pending:
        circleColor = Colors.white;
        icon = null;
        break;
      case StepStatus.disabled:
        circleColor = Colors.grey.shade300;
        icon = null;
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Left side
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: status == StepStatus.pending
                      ? primaryColor
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: icon != null
                  ? Icon(icon, color: Colors.white, size: 18)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color:
                    status == StepStatus.completed ||
                        status == StepStatus.current
                    ? primaryColor
                    : Colors.grey.shade300,
              ),
          ],
        ),

        const SizedBox(width: 16),

        /// Right side
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: status == StepStatus.disabled
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    if (status == StepStatus.current)
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          "Current Stage",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
                if (status == StepStatus.pending)
                  GestureDetector(
                    onTap: onMove,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Move here",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
