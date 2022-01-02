import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/styles/colors.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
        title: AppText(
          text: "Filters",
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
            color: Color(0xFFF2F3F2), borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel("Categories"),
            SizedBox(height: 15,),
            OptionItem(text: 'Eggs'),
            SizedBox(height: 15,),
            OptionItem(text: 'Noodles & Pasta'),
            SizedBox(height: 15,),
            OptionItem(text: 'Chips & Crisps'),
            SizedBox(height: 15,),
            OptionItem(text: 'Fast Food'),
            SizedBox(height: 15),
            getLabel("Brand"),
            SizedBox(height: 15,),
            OptionItem(text: 'Individual Collection'),
            SizedBox(height: 15,),
            OptionItem(text: 'Cocacola'),
            SizedBox(height: 15,),
            OptionItem(text: 'Ifad'),
            SizedBox(height: 15,),
            OptionItem(text: 'Kazi Formas'),
            SizedBox(height: 15,),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget getLabel(String text) {
    return Text(text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black));
  }
}

class OptionItem extends StatefulWidget {
  final String text;

  const OptionItem({Key? key, required this.text}) : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          children: [
            getCheckBox(), 
            SizedBox(
              width: 12,
            ),
            getTextWidget(),
          ],
        ),
      ),
    );
  }

  Widget getTextWidget() {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: checked ? AppColors.primaryColor : Colors.black,
      ),
    );
  }

  Widget getCheckBox() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        width: 25,
        height: 25,
        child: Container(
          decoration: new BoxDecoration(
            border: Border.all(
                width: checked ? 0 : 1.5,
                color: Color(0xffB1B1B1)), //Border.all
            borderRadius: new BorderRadius.circular(8),
            color: checked ? AppColors.primaryColor : Colors.transparent,
          ),
          child: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.transparent),
            child: Checkbox(
              value: checked,
              onChanged: (state) => setState(() => checked = !checked),
              activeColor: Colors.transparent,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ),
        ),
      ),
    );
  }
}