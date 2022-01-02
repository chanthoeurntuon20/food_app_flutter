import 'package:project_flutter/common/app_button.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/models/grocery_item.dart';
import 'package:project_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:project_flutter/screens/product_details/favourite_toggle_icon_widget.dart';
import 'package:project_flutter/screens/widgets/item_counter_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem groceryItem;
  const ProductDetailsScreen(this.groceryItem);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int amount = 1;

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
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "Product Details",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.groceryItem.name,
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        widget.groceryItem.description,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7C7C7C),
                        ),
                      ),
                      trailing: FavoriteToggleIcon(),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        ItemCounterWidget(onAmountChanged: (newAmount) {
                          setState(() {
                            amount = newAmount;
                          });
                        }),
                        Spacer(),
                        Text(
                          "\$${getTotalPrice().toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Divider(
                      thickness: 1,
                    ),
                    getProductDataRowWidget("Product Details"),
                    Divider(
                      thickness: 1,
                    ),
                    getProductDataRowWidget("Nutritions",
                        customWidget: nutritionWidget()),
                    Divider(
                      thickness: 1,
                    ),
                    getProductDataRowWidget("Review",
                        customWidget: ratingWidget()),
                    Spacer(),
                    getButton(context),
                    Spacer(),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget getProductDataRowWidget(String title, {Widget? customWidget}) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(
            text: title,
            textAlign: TextAlign.left,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          Spacer(),
          if (customWidget != null) ...[
            customWidget,
            SizedBox(
              width: 20,
            )
          ],
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffEBEBEB),
      ),
      child: AppText(
        text: "100gm",
        fontSize: 12,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Image(
        image: AssetImage(widget.groceryItem.imagePath),
      ),
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Add To Basket",
      fontWeight: FontWeight.w600,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
 Widget ratingWidget() {
    Widget starIcon() {
      return Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  double getTotalPrice() {
    return amount * widget.groceryItem.price;
  }
}
