import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget portraitLayout;
  final Widget landscapeLayout;

  ResponsiveLayout({this.portraitLayout, this.landscapeLayout});


  @override
  Widget build(BuildContext context) {
    if(SizeConfig.isPortrait && SizeConfig.isMobilePortrait){
      return portraitLayout;
    }
    else{
      return landscapeLayout;
    }
  }
}
