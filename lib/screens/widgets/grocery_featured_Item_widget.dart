import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/styles/colors.dart';
import 'package:flutter/material.dart';

class GroceryFeaturedItem {
  final String name;
  final String imagePath;

  GroceryFeaturedItem(this.name, this.imagePath);
}

var groceryFeaturedItems = [
  GroceryFeaturedItem("Pulses", "assets/images/pulses.png"),
  GroceryFeaturedItem("Rise", "assets/images/rise.png")
];

class GroceryFeaturedCard extends StatelessWidget {
  final GroceryFeaturedItem groceryFeaturedItem;
  final Color color;

  const GroceryFeaturedCard(this.groceryFeaturedItem,
      {this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 105,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
      decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Image(
            image: AssetImage(groceryFeaturedItem.imagePath),
          ),
          SizedBox(
            height: 15,
          ),
          AppText(
            text: groceryFeaturedItem.name,
            textAlign: TextAlign.center,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
