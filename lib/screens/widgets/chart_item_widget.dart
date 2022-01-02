import 'package:flutter/material.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/models/grocery_item.dart';
import 'package:project_flutter/screens/widgets/item_counter_widget.dart';
import 'package:project_flutter/styles/colors.dart';


class ChartItemWidget extends StatefulWidget {
  final GroceryItem item;

  const ChartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  _ChartItemWidgetState createState() => _ChartItemWidgetState();
}

class _ChartItemWidgetState extends State<ChartItemWidget> {
  final double heigth = 100;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 18;
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.item.name,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                  text: widget.item.description,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
                SizedBox(
                  height: 12,
                ),
                Spacer(),
                ItemCounterWidget(onAmountChanged: (newAmount) {
                  setState(() {
                    amount = newAmount;
                  });
                }),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.close,
                  color: AppColors.darkGrey,
                  size: 25,
                ),
                Spacer(
                  flex: 5,
                ),
                Container(
                  width: 70,
                  child: AppText(
                    text: "\$${getPrice().toStringAsFixed(2)}",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      width: 100,
      child: Image.asset(widget.item.imagePath),
    );
  }

  double getPrice() {
    return widget.item.price * amount;
  }
}