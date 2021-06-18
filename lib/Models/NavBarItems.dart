import 'package:aluta_market/Screens/AllCategories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NavBarItems {
  IconData icon;
  String title;

  NavBarItems({this.icon, this.title});
}


List<String> navBars = [
  'All categories',
  'Top Deals',
  'Make product request',
  'Track your order',
  'Coupons',
  'Live chat',
  'Sell your Products',
];

List<IconData> navBarIcons = [
  FontAwesomeIcons.list,
  FontAwesomeIcons.gifts,
  FontAwesomeIcons.clipboardList,
  FontAwesomeIcons.searchLocation,
  FontAwesomeIcons.tags,
  FontAwesomeIcons.comments,
  FontAwesomeIcons.buysellads,
];

navigateTo(int index){
  for(String navs in navBars){
    if(index == 0){
      Get.to(() => AllCategories());
    }
  }
}