import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_flutter/common/app_button.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/helpers/column_with_seperator.dart';
import 'package:project_flutter/models/grocery_item.dart';
import 'package:project_flutter/screens/widgets/chart_item_widget.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: AppText(
          text: "Order Lists",
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Column(
              children: getChildrenWithSeprator(
                addToLastChild: false,
                widgets: demoItems.map((e) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    width: double.maxFinite,
                    child: ChartItemWidget(item: e),
                  );
                }).toList(),
                seperator: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                  ),
                )
              ),
            ),
            Divider(thickness: 1,),
            getCheckOutButton(context),
          ],
        ),
        ),
      ),
    );
  }

  Widget getCheckOutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "Go To Check Out",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showButtonSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "\$12.96",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  void showButtonSheet(context) {
    // showModalBottomSheet(
    //   context: context,
    //   backgroundColor: Colors.transparent,
    //   isScrollControlled: true,
    //   builder:(BuildContext context){
    //     return CheckOutButtonSheet();
    //   });
  }
}