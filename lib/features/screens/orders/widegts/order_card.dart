import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String location;
  final String items;
  final String status;
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
    const primary = Color(0xFF0D3B66);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            /// Blue Left Strip
            Container(
              width: 4,
              color: primary,
            ),

            /// Card Content
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ===== 1️⃣ Top Row =====
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderId,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.grey,
                                      size: 14),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      location,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                      overflow:
                                          TextOverflow.ellipsis,
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
                            padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(6),
                              border: Border.all(
                                  color: Colors.red,
                                  width: 0.8),
                            ),
                            child: const Text(
                              "BREACHED",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// ===== 2️⃣ Middle Row =====
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(8),
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

                    /// ===== 3️⃣ Bottom Row =====
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              status,
                              style: TextStyle(
                                color: status ==
                                        "Ready for Delivery"
                                    ? Colors.green
                                    : primary,
                                fontWeight:
                                    FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),

                            if (timer != null &&
                                status == "Processing") ...[
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    timer!,
                                    style:
                                        const TextStyle(
                                      color: Colors.orange,
                                      fontSize: 13,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),

                        SizedBox(
                          height: 36,
                          child: ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              foregroundColor:
                                  Colors.white,
                              elevation: 0,
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        8),
                              ),
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                          horizontal: 14),
                            ),
                            onPressed: onPressed,
                            icon: buttonText ==
                                    "Start Pickup"
                                ? const Icon(
                                    Icons.qr_code_scanner,
                                    size: 14)
                                : const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12),
                            label: Text(
                              buttonText,
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}