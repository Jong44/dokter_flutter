import 'package:dokter_app/config/ColorConfig.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CardMetode extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  const CardMetode({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorConfig.primaryColor
            : ColorConfig.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon,
              color: isSelected ? Colors.white : ColorConfig.primaryColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : ColorConfig.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
