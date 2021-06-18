import 'package:flutter/material.dart';

class CartProducts{
  AssetImage image;
  String mainTitle;
  String subtitle;
  String price;
  String priceOff;
  String weight;
  IconData action;

  CartProducts({this.image,this.mainTitle,this.subtitle,this.price,this.priceOff,this.action,this.weight});

}