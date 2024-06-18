import 'package:dokter_app/config/ColorConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCategoriDokter extends StatelessWidget {
  final Color textColor;
  final Color color;
  final String text;
  final void Function() onDeleted;
  const CardCategoriDokter({
    super.key,
    required this.textColor,
    required this.color,
    required this.text,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onDeleted,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: textColor, width: 1)),
              child: Icon(
                CupertinoIcons.xmark,
                color: textColor,
                size: 11,
              ),
            ),
          )
        ],
      ),
    );
  }
}
