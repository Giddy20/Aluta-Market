import 'package:aluta_market/Screens/SubCategories.dart';
import 'package:aluta_market/Utilities/CategoryCard.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 8 : SizeConfig.heightMultiplier * 9),
          child: SubAppBar(pageName: 'All Categories', info: Icon(FontAwesomeIcons.search,)),
        ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal:0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('allCategories').snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text('Loading ...');
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (_,index) => InkWell(
                  onTap: (){
                    Get.to(() => SubCategories());
                  },
                    child: CategoryCard(image: AssetImage('images/Food.png'), cardTitle: "Men's Fashion",backgroundColor: Colors.blue.shade100, document: snapshot.data.docs[index],)),
              itemCount: snapshot.data.docs.length,

            );
          }
        ),
      )
    );
  }
}
