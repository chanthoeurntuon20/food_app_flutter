import 'package:project_flutter/models/grocery_item.dart';
import 'package:flutter/material.dart';

class HorizontalItemSlider extends StatelessWidget {
  List<GroceryItem> items;

  HorizontalItemSlider(this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onItemClick(context, items[index]);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 20,
            );
          },
          itemCount: items.length),
    );
  }

  void onItemClick(BuildContext context, GroceryItem item) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => ProductDetailsScreen(groceryItem)),
    //);
  }
}
