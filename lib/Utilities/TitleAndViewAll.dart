import 'package:flutter/material.dart';

import 'constants.dart';

class TitleAndViewAll extends StatelessWidget {
  String title;
  String action;

  TitleAndViewAll({this.title,this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            textScaleFactor: kTSF,
            style: kBold700.copyWith(
              fontSize: kTM * 2.189,
              color: kBlackColor,
            ),),

          InkWell(
              onTap: (){},
              child: Text(action,
                textScaleFactor: kTSF,
                style: kTextStyle.copyWith(
                  fontSize: kTM * 1.786,
                  color: kButtonColor,
                ),)
          ),


        ],
      ),
    );
  }
}
