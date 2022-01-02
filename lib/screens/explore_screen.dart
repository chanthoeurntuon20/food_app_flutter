import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/screens/product_details/category_item_screen.dart';
import 'package:project_flutter/screens/widgets/search_bar_widget.dart';
import 'package:project_flutter/screens/widgets/category_item_screen_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_flutter/models/category_item.dart';
List<Color> gridColors = [
  Color(0xff53B175),
  Color(0xffF8A44C),
  Color(0xffF7A593),
  Color(0xffD3B0E0),
  Color(0xffFDE598),
  Color(0xffB7DFF5),
  Color(0xff836AF6),
  Color(0xffD73B77),
];
class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getHeader(),
            Expanded(child: getStaggerGridView(context),),
          ],
        ),
      ),
    );
  }
  Widget getHeader(){
    return Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: AppText(
            text: 'Find Products',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: SearchBarWidget(),)
      ],
    );
  }
  Widget getStaggerGridView(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 4,
      children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
        int index = e.key;
        CategoryItem categoryItem = e.value;
        return GestureDetector(
          onTap: (){
            onCategoryItemClicked(context,categoryItem);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: CategoryItemCardWidget(
              item: categoryItem,
              color: gridColors[index % gridColors.length],
            ),
          ),
        );
      }).toList(),
      staggeredTiles: categoryItemsDemo
          .map<StaggeredTile>((e) => StaggeredTile.fit(2)).toList(),
          mainAxisSpacing: 3.0,
      crossAxisSpacing: 4.0,
      );
  }
  void onCategoryItemClicked(BuildContext conext, CategoryItem item){
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context){
          return CategoryItemsScreen(title: item.name);
    }));
  }
}

