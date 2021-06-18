import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class RelatedProducts extends StatelessWidget {
  final AssetImage image;
  final String cardTitle;
  final Color backgroundColor;

  RelatedProducts({this.image,this.cardTitle, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.837),
      margin: EdgeInsets.only(top: 16, bottom: 8, right: 10),
      width: SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 13.714 : SizeConfig.heightMultiplier * 15.714,
      height: SizeConfig.heightMultiplier * 14.289,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 8.880,
            width: SizeConfig.heightMultiplier * 11.880,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 1)
            ),
            child: Image(
              image: image,
              width: SizeConfig.textMultiplier * 4.167,
              height: SizeConfig.textMultiplier  * 3.909,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(cardTitle, style: kBold700.copyWith(
                fontSize: 12,
                color: backgroundColor == kButtonColor ? kWhiteColor : kBlackColor
            ),),
          )
        ],
      ),
    );
  }
}