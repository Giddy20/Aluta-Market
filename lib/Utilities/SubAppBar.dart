import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class SubAppBar extends StatelessWidget {
  SubAppBar({
    @required this.pageName,this.info
  });

  final String pageName;
  final Widget info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Color(0xFFFDFDFD),
          height: SizeConfig.heightMultiplier * 8,
          padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2.4,right: SizeConfig.heightMultiplier * 2.4, top: SizeConfig.heightMultiplier * 1, bottom: SizeConfig.heightMultiplier * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pageName,
                textScaleFactor: kTSF,
                style: kBold500.copyWith(
                  fontSize: kM * 3.274,
                ),),
              info,
            ],
          ),
        ),
      ],
    );
  }
}
