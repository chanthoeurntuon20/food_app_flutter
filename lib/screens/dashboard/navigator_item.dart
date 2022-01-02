import 'package:project_flutter/screens/account/account_screen.dart';
import 'package:project_flutter/screens/cart/cart_screen.dart';
import 'package:project_flutter/screens/explore_screen.dart';
import 'package:project_flutter/screens/favourite_screen.dart';
import 'package:project_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem('Shop', 'assets/icons/shop_icon.svg', 0, HomeScreen()),
  NavigatorItem('Explore', 'assets/icons/explore_icon.svg', 0, ExploreScreen()),
  NavigatorItem('Cart', 'assets/icons/cart_icon.svg', 0, CartScreen()),
  NavigatorItem('Favourite', 'assets/icons/favourite_icon.svg', 0, FavouriteScreen()),
  NavigatorItem('Account', 'assets/icons/account_icon.svg', 0, AccountScreen())
];
