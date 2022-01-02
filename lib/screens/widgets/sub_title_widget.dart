import 'package:project_flutter/styles/colors.dart';
import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String title;
  const SubTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          'See All',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
