import 'package:flutter/material.dart';
import 'package:clean_go_vendor_app/core/constants/app_colors.dart';
import 'package:clean_go_vendor_app/core/enums/order_status.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String location;
  final String items;
  final OrderStatus status;
  final String buttonText;
  final String price;
  final List<String> tags;
  final String? timer;
  final bool isBreached;
  final VoidCallback? onPressed;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.location,
    required this.items,
    required this.status,
    required this.buttonText,
    required this.price,
    required this.tags,
    this.timer,
    required this.isBreached,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: AppColors.primary, width: 5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Top Row =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Left Side
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Order ID + Timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          orderId,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        /// Timer badge
                        if (timer != null && status == OrderStatus.processing)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 12,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  timer!,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    /// Location Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// BREACHED Badge
              if (isBreached)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.green, width: 0.95),
                  ),
                  child: const Text(
                    "BREACHED",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          /// ===== Middle Row =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (tags.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: tags.first == "FAST"
                            ? const Color(0xFFFFF3CD)
                            : tags.first == "STANDARD"
                            ? const Color(0xFFE8F5E8)
                            : const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: tags.first == "FAST"
                              ? Colors.orange
                              : tags.first == "STANDARD"
                              ? Colors.green
                              : Colors.grey,
                          width: 0.8,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            tags.first == "FAST"
                                ? Icons.bolt
                                : tags.first == "STANDARD"
                                ? Icons.check_circle
                                : Icons.label,
                            size: 12,
                            color: tags.first == "FAST"
                                ? Colors.orange
                                : tags.first == "STANDARD"
                                ? Colors.green
                                : Colors.grey,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            tags.first,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: tags.first == "FAST"
                                  ? Colors.orange
                                  : tags.first == "STANDARD"
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],

                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(text: '${items.split('•')[0]}• '),
                        TextSpan(
                          text: items.split('•')[1].trim(),
                          style: const TextStyle(
                            color: Color(0xFF0D3B66),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 0.5),
          const SizedBox(height: 12),

          /// ===== Bottom Row =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status.displayName,
                style: TextStyle(
                  color: status == OrderStatus.readyForDelivery
                      ? Colors.green
                      : AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),

              SizedBox(
                height: 36,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                  onPressed: onPressed,
                  icon: buttonText == "Start Pickup"
                      ? const Icon(Icons.qr_code_scanner, size: 14)
                      : const Icon(Icons.arrow_forward_ios, size: 12),
                  label: Text(
                    buttonText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
