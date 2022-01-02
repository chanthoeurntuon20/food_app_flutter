import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/models/category_item.dart';
class CategoryItemCardWidget extends StatelessWidget{
  CategoryItemCardWidget(
  {Key? key, required this.item,this.color = Colors.blue}):super(key:key);
  final CategoryItem item;
  final Color color;
  final widget = 175.0;
  final heigth = 2000;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5,bottom: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Color(0xffE2E2E2),
        ),
      ),
      child: Column(
       children: [
         Container(
           height: 120,
           width: 120,
           child: imageWidget(),
         ),
         SizedBox(
           height: 60,
           child: Center(
             child: AppText(
               text: item.name,
               textAlign: TextAlign.center,
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
           ),
         )
       ],
      ),
    );
  }
 Widget imageWidget(){
    return Container(
      child: Image.asset(
        item.imagePath,
        fit: BoxFit.contain,
      ),
    );
 }
}