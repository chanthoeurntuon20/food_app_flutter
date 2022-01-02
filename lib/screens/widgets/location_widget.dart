import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationWidget extends StatelessWidget {
  String iconPath = "assets/icons/location_icon.svg";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(
          width: 8,
        ),
        Text(
          'Phnom Penh, Cambodia',
          style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
