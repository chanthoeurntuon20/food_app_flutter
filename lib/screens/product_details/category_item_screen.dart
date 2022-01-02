import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/models/grocery_item.dart';
import 'package:project_flutter/screens/product_details/product_detail_screen.dart';
import 'package:project_flutter/screens/product_details/filter_screen.dart';
import 'package:project_flutter/screens/widgets/grocery_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryItemsScreen extends StatelessWidget {
  final String title;

  const CategoryItemsScreen({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                   MaterialPageRoute(builder: ( context) => FilterScreen()));
            },
            child: Container(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.sort,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 4,
        children: beverages.asMap().entries.map<Widget>((e) {
          GroceryItem groceryItem = e.value;
          return GestureDetector(
            onTap: () {
              onItemClicked(context, groceryItem);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: GroceryItemCardWidget(
                item: groceryItem,
              ),
            ),
          );
        }).toList(),
        staggeredTiles:
            beverages.map<StaggeredTile>((e) => StaggeredTile.fit(2)).toList(),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 0.0,
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetailsScreen(item)));
  }
}
