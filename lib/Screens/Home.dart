import 'package:aluta_market/Controllers/ProductController.dart';
import 'package:aluta_market/Models/PopularProducts.dart';
import 'package:aluta_market/Presentation/aluta_shop_icons_icons.dart';
import 'package:aluta_market/Screens/ProductDetails.dart';
import 'package:aluta_market/Utilities/AppBar.dart';
import 'package:aluta_market/Utilities/BottomNavigationBar.dart';
import 'package:aluta_market/Utilities/CategoryCard.dart';
import 'package:aluta_market/Utilities/InfoHeading.dart';
import 'package:aluta_market/Utilities/SideNavigation.dart';
import 'package:aluta_market/Utilities/TitleAndViewAll.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatelessWidget {

 final ProductController productController = Get.put(ProductController());

 // RxString deliveryAddress = 'No 22, Iyana Ibigbami Street, Opp IITA'.obs;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.00,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: kBlackColor,
                size: SizeConfig.textMultiplier * 3.671,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          backgroundColor: Colors.grey.shade100,
          title:  Container(
            alignment: Alignment.bottomLeft,
            child: FittedBox(
              child: Text('Delivers to',
                textScaleFactor: kTSF,
                style: kBold700.copyWith(fontSize: SizeConfig.textMultiplier * 1.636,),),
              fit: BoxFit.scaleDown,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Icon(
                FontAwesomeIcons.search,
                size: SizeConfig.textMultiplier * 3.071,
                color: kBlackColor,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 2 : SizeConfig.heightMultiplier * 9),
            child: SizeConfig.isPortrait ? AppBarPortrait() : AppBarLandscape(),
          ),
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Drawer(
              child: SideNavigator(),
          ),
        ),

        body: Container(
          color: Colors.grey.shade100,
            padding: EdgeInsets.symmetric(horizontal: kM * 2.38) ,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 65,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: kM * 0.6),
                child: SizeConfig.isPortrait ? StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('homepageInfo').snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) return Center(child: const Text('Loading...'));
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            FittedBox(
                                fit: BoxFit.fitHeight,
                                child: InfoHeading(document: snapshot.data.docs[index],)
                            ),
                      itemCount: snapshot.data.docs.length,
                    );

                  }
                ) : Text('dd'),
              ),


              SizedBox(
                height: 10,
              ),

              Container(
                height: kM * 15.86,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                ),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('allCategories').snapshots(),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData) return Center(child: const Text('Loading...'));
                      return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>  InkWell(
                          child: CategoryCard(image: AssetImage('images/Food.png'), cardTitle: "Men's Fashion",backgroundColor: Colors.grey.shade50, document: snapshot.data.docs[index],)),
                      itemCount: snapshot.data.docs.length,

                );
                    }
                  ),

                ),

              Container(
                  margin: EdgeInsets.only(top: kM * 1.190),
                  child:TitleAndViewAll(title: 'Bundle Offers', action: 'View All',),
                ),

              Container(
                height: SizeConfig.heightMultiplier * 28.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => BundleOffersCard(),
                  itemCount: 3,

                )
              ),

              InkWell(
                onTap: (){
                  productController.popularProducts.add(
                    PopularProductsList(price: '3100', mainTitle: 'Indomie Jollof',weight: '2000'),
                  );
                },
                child: Container(
                  child: TitleAndViewAll(title: 'Popular', action: 'View All',),
                ),
              ),

             LimitedBox(
               child: StreamBuilder<QuerySnapshot>(
                 stream: FirebaseFirestore.instance.collection('products').snapshots(),
                 builder: (context, snapshot){
                   if(!snapshot.hasData) return const Text('Loading ...');
                   return ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) => InkWell(
                         onTap: (){
                           print(SizeConfig.screenHeight);
                           Get.to(() => ProductDetails(index: index,));
                         },
                         child: PopularProducts(context, snapshot.data.docs[index])),
                     itemCount: snapshot.data.docs.length,

                   );

                 }
               ),
             ),

            ],
          )
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}










  Widget PopularProducts(BuildContext context, DocumentSnapshot document) {


    return Container(
           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
           width: double.infinity,
           margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
           decoration: BoxDecoration(
             color: Colors.grey.shade50,
             borderRadius: BorderRadius.circular(5),
               boxShadow: [
                 BoxShadow(
                     color: Colors.grey[300],
                     offset: Offset(4,4),
                     blurRadius: 15,
                     spreadRadius: 1
                 ),
                 BoxShadow(
                     color: Colors.white,
                     offset: Offset(-4,-4),
                     blurRadius: 15,
                     spreadRadius: 1
                 )
               ]
           ),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       Container(
                         height:55,
                         width: 55,
                         child: FittedBox(
                           fit: BoxFit.fitWidth,
                           child: Image(
                             image: AssetImage('images/${document['productImage']}.png'),
                             width: SizeConfig.textMultiplier * 4.167,
                             height: SizeConfig.textMultiplier  * 3.909,
                           ),
                         ),
                       ),

                       SizedBox(width: 12,),

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             child: FittedBox(
                               fit: BoxFit.scaleDown,
                               child: Text(document['productName'],
                                 textScaleFactor: kTSF,
                                 style: kBold500.copyWith(
                                   fontSize: 15,
                                 ),),
                             ),
                           ),
                           Container(

                             child: FittedBox(
                               fit: BoxFit.scaleDown,
                               child: Text('${(document['weight']/1000).toString()}kg',
                                 textScaleFactor: kTSF,
                                 style: kTextStyle.copyWith(
                                   fontSize: 14,
                                   color: Color(0x690E0F19),
                                 ),),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),


                   Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         FittedBox(
                           fit: BoxFit.fitWidth,
                           child: Text('₦${document['productPrice']}',
                             textScaleFactor: kTSF,
                             style: kBold500.copyWith(
                               fontSize: 16,
                             ),),
                         ),
                         Text((document['productPrice'] + (document['productPrice'] * (document['discount']/100))).toString(),
                           textScaleFactor: kTSF,
                           style: kTextStyle.copyWith(
                             fontSize: 14,
                             color: kButtonColorFade,
                             decoration: TextDecoration.lineThrough,
                           ),),

                         Container(
                           padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 237, 73, 67,),
                            borderRadius: BorderRadius.circular(2),
                          ),
                           child: Row(
                             children: [
                               Text('Qty in Stock:',
                                 textScaleFactor: kTSF,
                                 style: kTextStyle.copyWith(
                                   fontSize: 12,
                                   color: kBlackColor,
                                 ),),

                               SizedBox(width: 3,),

                               Text(document['stockQty'].toString(),
                                 textScaleFactor: kTSF,
                                 style: kTextStyle.copyWith(
                                   fontSize: 12,
                                   color: kButtonColorFade,
                                 ),),
                             ],
                           ),
                         )
                       ],
                     ),
                   ),


                 ],)
             ],
           ),
         );
  }



class BundleOffersCard extends StatelessWidget {
   BundleOffersCard({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kM * 0.744,left: kM * 0.744,right: kM * 0.744, bottom: 6),
      height: kM * 27.381,
      width: kM * 23.512,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(62), topRight: Radius.circular(22), bottomRight: Radius.circular(62), bottomLeft: Radius.circular(22) ),
        color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(4,4),
                blurRadius: 15,
                spreadRadius: 1
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4,-4),
                blurRadius: 15,
                spreadRadius: 1
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: kM * 0.744,left: kM * 0.744,right: kM * 0.744, bottom: kM * 0.748),
              height: kM * 14.285,
              width: kM * 22.024,
              decoration: BoxDecoration(
                color: Color(0xFFe7f7e2),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(52), topRight: Radius.circular(12), bottomRight:Radius.circular(52) , bottomLeft: Radius.circular(12),),
              ),
            child: Image(
              image: AssetImage('images/Food.png'),
              width: kM * 4.167,
              height: kM * 3.909,
            ),
    ),

          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text('Cooking essentials',
              textScaleFactor: kTSF,
            style: kBold500.copyWith(
              fontSize: kTM *2.083,
            ),),
          ),
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text('ACI Salt,Fresh Sugar, Oil\nRice, Dal',
              textScaleFactor: kTSF,
              style: kTextStyle.copyWith(
                fontSize: kTM * 1.488,
              ),)
          ),
          Container(
            height: 18,
            margin: EdgeInsets.symmetric(vertical: kM * 0.744),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('₦3400',
                    textScaleFactor: kTSF,
                    style: kBold700.copyWith(
                      fontSize: kTM * 2.481,
                    ),),
                ),
                // Icon(
                //   FontAwesomeIcons.plus,
                //   color: kButtonColor,
                //   size: kM * 1.78,
                // )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

