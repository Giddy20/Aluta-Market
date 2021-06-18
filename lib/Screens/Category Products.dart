import 'package:aluta_market/Screens/Home.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryProducts extends StatelessWidget {

 static RxBool visible = true.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 8 : SizeConfig.heightMultiplier * 9),
          child: SubAppBar(pageName: 'Category Products', info: Icon(FontAwesomeIcons.filter,size: 22,color: kButtonColor,)),
        ),

        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:0),
              child: GestureDetector(
                onDoubleTap: (){
                  visible.value = true;
                },
                child: ListView(
                  children: [
                   Container(
                     height: 36,
                     child: GetBuilder(
                       builder: (s) => ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: 6,
                           itemBuilder: (context, index) => FilterParams(title: 'Price',)
                       ),
                     ),
                   ),

                    SizedBox(height: 10,),

                    // LimitedBox(
                    //   child: ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //       itemBuilder: (context,index) => PopularProducts(),
                    //     itemCount: 15,
                    //   ),
                    // )

                  ],
                ),
              )
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.78,
                left: MediaQuery.of(context).size.width * 0.23,
                child: Obx(() =>  Visibility(
                  visible: visible.value,
                  child: GestureDetector(
                    onDoubleTap: (){
                      visible.value = false;
                    },
                    child: Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.shoppingBag,color: kWhiteColor),
                          SizedBox(width: 20,),
                          Text('4 items in cart',style: kBold700.copyWith(color: kWhiteColor,fontSize: 14),)
                        ],
                      ),
                    ),
                  ),
                ),),)
          ],
        )
    );
  }
}

class FilterParams extends StatelessWidget {
   FilterParams({
    Key key,
    this.title
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kButtonColor,
      ),
      child: Center(child: Text(title,style: kBold700.copyWith(color: kWhiteColor, fontSize: 13),)),
    );
  }
}
