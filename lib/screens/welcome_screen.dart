import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/common/theme_helper.dart';
import 'package:project_flutter/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_flutter/screens/dashboard/dashboard_screen.dart';
class WelcomeSreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final String imagePath = "assets/image/classy-restaurant.jpeg";
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              icon(),
              SizedBox(
                height: 20,
              ),
              welcomTextWidget(),
              SizedBox(
                height: 20,
              ),
              sloganText(),
              SizedBox(
                height: 20,
              ),
              getButton(context),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
        ,
      ),
    );
  }
  Widget icon(){
    const String iconPath = "asset/icons/app_icon.svg";
    return SvgPicture.asset(
      iconPath,
      width: 48,
      height: 56,
    );
  }
  Widget welcomTextWidget(){
    return Column(
      children: [
        Text(
          'Welcom',
          style: TextStyle(
              fontSize: 48,fontWeight: FontWeight.w600,color:Colors.white),
        ),
        Text(
          'to our store',
          style:TextStyle(
              fontSize: 48,fontWeight: FontWeight.w600,color:Colors.white),
        ),
      ],
    );
  }
  Widget  sloganText(){
    return Text(
      'Get your grecories as fast as in hour',
      style:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color:Colors.white.withOpacity(0.7),
      ),
    );
  }
  Widget  getButton(BuildContext context){
    return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        onPressed:(){
          onGetStatedClicked(context);
        },
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            'Get Started',
            style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:Colors.white),
          ),
        ),
      ),
    );
  }
  void onGetStatedClicked(BuildContext context){
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => DashboardScreen()));
  }
}
