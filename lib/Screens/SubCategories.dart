import 'package:aluta_market/Utilities/CategoryCard.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 8 : SizeConfig.heightMultiplier * 9),
          child: SubAppBar(pageName: 'Sub Categories', info: Icon(FontAwesomeIcons.search,)),
        ),

        body: Container(
          padding: EdgeInsets.symmetric(horizontal:0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (_,index) => CategoryCard(image: AssetImage('images/Food.png'), cardTitle: "Men's Fashion",backgroundColor: Colors.blue.shade100),
            itemCount: 9,

          ),
        )
    );
  }
}
