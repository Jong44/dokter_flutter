import 'package:dokter_app/config/ColorConfig.dart';
import 'package:flutter/material.dart';

class CardTime extends StatelessWidget {
  final String time;
  final bool isSelected;
  const CardTime({
    super.key,
    required this.time,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorConfig.primaryColor
            : ColorConfig.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : ColorConfig.primaryColor,
        ),
      ),
    );
  }
}
