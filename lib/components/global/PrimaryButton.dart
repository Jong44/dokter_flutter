import 'package:dokter_app/config/ColorConfig.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onpress;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConfig.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
