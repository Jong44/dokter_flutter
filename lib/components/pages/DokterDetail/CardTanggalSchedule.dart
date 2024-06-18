import 'package:dokter_app/config/ColorConfig.dart';
import 'package:flutter/material.dart';

class CardTanggalSchedule extends StatelessWidget {
  final String tanggal;
  final String hari;
  final bool isSelected;
  const CardTanggalSchedule({
    super.key,
    required this.tanggal,
    required this.hari,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConfig.primaryColor
                : ColorConfig.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            tanggal,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : ColorConfig.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          hari,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorConfig.textGrey,
          ),
        ),
      ],
    );
  }
}
