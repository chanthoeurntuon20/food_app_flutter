import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/models/grocery_item.dart';
import 'package:project_flutter/styles/colors.dart';
import 'package:flutter/material.dart';

class GroceryItemCardWidget extends StatelessWidget {
  final GroceryItem item;

  const GroceryItemCardWidget({Key? key, required this.item}) : super(key: key);

  final double width = 174;
  final double height = 250;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRaduis = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(item.imagePath),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              text: item.name,
              fontSize: 16,
              textAlign: TextAlign.right,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: item.description,
              fontSize: 14,
              textAlign: TextAlign.right,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7C7C7C),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                AppText(
                  text: "\$${item.price.toStringAsFixed(2)}",
                  textAlign: TextAlign.left,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                addWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget addWidget() {
  return Container(
    height: 45,
    width: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.primaryColor,
    ),
    child: Center(
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 25,
      ),
    ),
  );
}
