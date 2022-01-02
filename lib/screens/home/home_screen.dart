import 'package:project_flutter/screens/product_details/product_detail_screen.dart';
import 'package:project_flutter/screens/widgets/grocery_featured_Item_widget.dart';
import 'package:project_flutter/screens/widgets/grocery_item_card_widget.dart';
import 'package:project_flutter/screens/widgets/home_banner_widget.dart';
import 'package:project_flutter/screens/widgets/location_widget.dart';
import 'package:project_flutter/models/grocery_item.dart';
import 'package:project_flutter/screens/widgets/search_bar_widget.dart';
import 'package:project_flutter/screens/widgets/sub_title_widget.dart';
import 'package:project_flutter/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset('assets/icons/app_icon_color.svg'),
                  SizedBox(
                    height: 5,
                  ),
                  padded(LocationWidget()),
                  SizedBox(
                    height: 15,
                  ),
                  padded(SearchBarWidget()),
                  SizedBox(
                    height: 20,
                  ),
                  padded(HomeBanner()),
                  SizedBox(
                    height: 20,
                  ),
                  padded(SubTitle("Exclusive Order")),
                  SizedBox(
                    height: 15,
                  ),
                  padded(getHorizontalItemSlider(exclusiveOffers)),
                  SizedBox(
                    height: 20,
                  ),
                  padded(SubTitle("Best Selling")),
                  padded(getHorizontalItemSlider(bestSelling)),
                  SizedBox(
                    height: 15,
                  ),
                  padded(SubTitle("Groceries")),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 105,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        GroceryFeaturedCard(
                          groceryFeaturedItems[0],
                          color: Color(0xffF8A44C),
                        ),
                        SizedBox(width: 20,),
                        GroceryFeaturedCard(
                          groceryFeaturedItems[1],
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  padded(getHorizontalItemSlider(groceries)),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget padded(Widget widget) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: widget,
  );
}

Widget getHorizontalItemSlider(List<GroceryItem> items) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 250,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onItemClicked(context, items[index]);
          },
          child: GroceryItemCardWidget(
            item: items[index],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 20,
        );
      },
    ),
  );
}

void onItemClicked(BuildContext context, GroceryItem item) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(item)),
  );
}
