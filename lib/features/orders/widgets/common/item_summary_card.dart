import 'package:flutter/material.dart';
import 'item_row.dart';

class ItemSummaryCard extends StatelessWidget {
  const ItemSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Items Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 14),
          ItemRow(name: "Shirt", qty: "x4"),
          ItemRow(name: "Trousers", qty: "x2"),
          ItemRow(name: "Saree", qty: "x1"),
        ],
      ),
    );
  }
}
