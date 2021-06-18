import 'package:aluta_market/Controllers/ProductController.dart';
import 'package:aluta_market/Utilities/CartItem.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'Checkout.dart';


class Cart extends StatelessWidget {

  ProductController productController = Get.put(ProductController());

  RxString totalPrice = '₦ 1340'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 8 : SizeConfig.heightMultiplier * 9),
        child: SubAppBar(pageName: 'Cart', info: Text('${productController.cartProducts.length} Items',textScaleFactor: kTSF, style: kBold500.copyWith(
            fontSize: kM * 2.38,
            color: kButtonColor
        ),),),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: kM * 2.38,right: kM * 2.38),
        child: Container(
          color: Color(0xFFFDFDFD),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              LimitedBox(
                child: Obx(() => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CartItem(
                    productName: productController.cartProducts[index].mainTitle,
                    productPrice: int.parse(productController.cartProducts[index].price).obs,
                    weight: productController.cartProducts[index].weight,
                    productImage: productController.cartProducts[index].image,
                  ),
                  itemCount: productController.cartProducts.length,
                ),
                ),
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: kM * 2.38, vertical: kM * 1.64),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(kM * 2.98)),
                ),
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      margin: EdgeInsets.only(top: kM * 7.44),
                      child: Row(
                        children: [
                          Icon( FontAwesomeIcons.tag,
                            size: kM * 2.09,
                            color: kButtonColor,
                          ),

                          SizedBox(width: kM * 1.49,),

                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('Apply Discount Code',
                              textScaleFactor: kTSF,
                              style: kTextStyle.copyWith(
                                color: kButtonColor,
                                fontSize: kM * 2.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: kM * 2.23,top: kM * 1.49),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub Total',
                            textScaleFactor:kTSF,
                            style: kTextStyle.copyWith(
                                fontSize: kM * 1.93
                            ),),
                          Text('₦ 1290',
                            textScaleFactor: kTSF,
                            style: kTextStyle.copyWith(
                                fontSize: kM * 1.98
                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: kM * 1.49),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping Fee',
                            textScaleFactor: kTSF,
                            style: kTextStyle.copyWith(
                                fontSize: kM * 1.90
                            ),),
                          Text('₦ 50',
                            textScaleFactor: kTSF,
                            style: kTextStyle.copyWith(
                                fontSize: kM * 1.98
                            ),),
                        ],
                      ),
                    ),

                    Divider(),

                    Padding(
                      padding: EdgeInsets.only(bottom: kM * 1.49),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('Total',
                              textScaleFactor: kTSF,
                              style: kBold700.copyWith(
                                  fontSize: kM * 2.23
                              ),),
                          ),

                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(totalPrice.value,
                              textScaleFactor: kTSF,
                              style: kBold700.copyWith(
                                  fontSize: kM * 2.87
                              ),),
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Get.to(() => Checkout(),arguments: totalPrice.value);
                        print(kM);
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: kM * 1.49, bottom: kM * 2.98),
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(kM * 0.75),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Center(
                            child: Text('Proceed to checkout',
                              textScaleFactor: kTSF,
                              style: kBold700.copyWith(
                                fontSize: kM * 2.38,
                                color: kWhiteColor,
                              ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

