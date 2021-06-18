import 'package:aluta_market/Controllers/ProductController.dart';
import 'package:aluta_market/Models/CartProducts.dart';
import 'package:aluta_market/Screens/Cart.dart';
import 'package:aluta_market/Utilities/CartItem.dart';
import 'package:aluta_market/Utilities/ProductDetailsTitle.dart';
import 'package:aluta_market/Utilities/Related%20Products.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/TitleAndViewAll.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {

  int index;

  ProductDetails({this.index});

  ProductController productController = Get.put(ProductController());

  var hhh = FirebaseFirestore.instance.collection('products').get();

  var fireInstance = FirebaseFirestore.instance.collection('cartItems');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 8 : SizeConfig.heightMultiplier * 9),
        child: SubAppBar(pageName: '', info: InkWell(
          onTap: (){
            Get.to(() => Cart());
          },
          child: Stack(
            children: [
              IconButton(
                  icon: Icon(FontAwesomeIcons.shoppingBag,
                    color: kButtonColor,
                    size: 24,
                  ),

                  onPressed: (){
                    Get.to(() => Cart());
                  }),
              Positioned(
                  right: 8,
                  top: 3,
                  child: Obx(() => Text('${productController.cartProducts.length}',
                    textScaleFactor: kTSF,
                    style: kBold700.copyWith(
                      fontSize: 13,
                      color: kButtonColor,
                    ),)),)
            ],
          ),
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kM * 2.38),
        child: Container(
          child: ListView(
            children: [

              Container(
                height: kM * 37.86,
                child: GetBuilder(
                  builder: (s) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('products').snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData) return Center(child: const Text('Loading ...'));
                        return PageView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            color: kWhiteColor,
                            child: Image(image: AssetImage('images/${snapshot.data.docs[index]['productImage']}.png'),
                            fit: BoxFit.scaleDown,),
                          ),
                          itemCount: snapshot.data.docs.length,
                        );
                      }
                    );
                  }
                ),
              ),


              Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('products').snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) return Center(child: const Text('Loading ...'));
                    return ProductDetailsTitle(
                      productName: snapshot.data.docs[index]['productName'],
                      productPrice: snapshot.data.docs[index]['productPrice'],
                      productWeight: snapshot.data.docs[index]['weight'],
                      productQty: snapshot.data.docs[index]['stockQty'],
                    );
                  }
                ),
              ),

              TitleAndViewAll(title: 'Description', action: '',),

              SizedBox(height: 10,),

              Text('Nestle koko krunch breakfast cereal is made with whole grain which contains more dietary fibre, nutrition values  and important minerals like iron and calcium which is really important for healthy red blood cells and bone development in children',
                textScaleFactor: kTSF,
                style: kTextStyle.copyWith(
                fontSize: 14,
                color: Color(0x700E0F19),
              ),),

              SizedBox(height: 10,),



              InkWell(
                onTap: (){

                  hhh.then((value) {
                    print(value.docs[index]['productName']);

                    // Map cartData = {'productName': value.docs[index]['productName'], 'productPrice': value.docs[index]['productPrice'],
                    //   'weight': value.docs[index]['weight']
                    //
                    // };
                    // addData(cartData);


                    productController.cartProducts.add(
                        CartProducts(
                          mainTitle: value.docs[index]['productName'],
                          price: value.docs[index]['productPrice'].toString(),
                          weight: value.docs[index]['weight'].toString(),
                          priceOff: 'fff',
                            action: Icons.ac_unit,

                          image:  AssetImage('images/${value.docs[index]['productImage']}.png'),
                        )
                    );
                    Get.snackbar(
                        'Successful', 'Item has been added to your cart',
                    snackPosition: SnackPosition.BOTTOM);
                  });


                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 25,horizontal: 1),
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('Add to Cart',
                        textScaleFactor: kTSF,
                        style: kBold700.copyWith(
                          fontSize: 16,
                          color: kWhiteColor,
                        ),),
                    )
                ),
              ),

              TitleAndViewAll(title: 'Related products', action: '',),

              Container(
                  margin: EdgeInsets.only(bottom: 25),
                  height: kM * 17.86,
                  child: GetBuilder(
                    builder: (s) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>  InkWell(
                          child: RelatedProducts(image: AssetImage('images/Food.png'), cardTitle: "Men's Fashion",backgroundColor: Colors.blue.shade100,)),
                      itemCount: 6,

                    ),
                  )
              ),



            ],
          ),
        ),
      ),
    );
  }

  Future<void> addData(data) async{
    FirebaseFirestore.instance.collection('cartItems').add(data).catchError((e) {
      print(e);
    });
  }
}
