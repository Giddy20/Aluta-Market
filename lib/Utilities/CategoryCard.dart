import 'dart:io';

import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class CategoryCard extends StatelessWidget {
  final AssetImage image;
  final String cardTitle;
  final Color backgroundColor;

  DocumentSnapshot document;

  CategoryCard({this.image,this.cardTitle, this.backgroundColor, this.document});

  var db = FirebaseFirestore.instance.collection('male').doc('Fashion').collection('male');


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1.067),
      margin: EdgeInsets.only(top: 16, bottom: 8, right: 10, left: 10),
      width: SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 13.714 : SizeConfig.heightMultiplier * 15.714,
      height: SizeConfig.heightMultiplier * 15.289,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(4,4),
                blurRadius: 15,
                spreadRadius: 1
            ),
            BoxShadow(
                color: Colors.blueGrey[50],
                offset: Offset(-4,-4),
                blurRadius: 15,
                spreadRadius: 1
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 7.440,
            width: SizeConfig.heightMultiplier * 7.440,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 18),

            ),
            child: Image(
              image: image,
              width: SizeConfig.textMultiplier * 4.167,
              height: SizeConfig.textMultiplier  * 3.909,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(document['category'],
            textScaleFactor: kTSF,
            style: kBold700.copyWith(
              fontSize: 13,
              color: backgroundColor == kButtonColor ? kWhiteColor : kBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
