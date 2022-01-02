import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_flutter/common/app_text.dart';
import 'package:project_flutter/helpers/column_with_seperator.dart';
import 'package:project_flutter/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AccountItem.dart';

class AccountScreen extends StatelessWidget {
   Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children:[
                SizedBox(
                  height: 20,
                  ),
               ListTile(
                leading: SizedBox(
                  width: 65,
                  height: 65,
                  child: getImageHeader(),
                ),
                title: AppText(
                  text: "Chanthoeurn Tuon",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  
                ),
                subtitle: AppText(
                  text: "chanthoeurntuon20@gmail.com",
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal, 
                ),
              ),
              Column(
                children: getChildrenWithSeprator(
                  widgets: accountItems.map((e){
                    return getAccountItemWidget(e);
                  }).toList(),
                   seperator: Divider(
                     thickness: 1,
                   ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              logoutbutton(),
              SizedBox(
                height: 20,
              )
              ],
            ),
          ),
        ),
      );
  }
  Widget getImageHeader(){
    String imagePath = "assets/images/account_image.jpg";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }
  Widget getAccountItemWidget(AccountItem accountItem){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              accountItem.iconPath,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            accountItem.label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
  Widget logoutbutton(){
    return Container( 
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: RaisedButton(
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Color(0xffF2F3F2),
        textColor: Colors.white,
        elevation: 0.0,
        padding: EdgeInsets.symmetric(vertical: 24,horizontal: 25),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/account_icons/logout_icon.svg",
              ),
            ),
            Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container(),
          ],
        ),
        onPressed: (){
        },
      ),
    );
  }
}