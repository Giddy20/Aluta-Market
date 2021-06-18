import 'package:aluta_market/Screens/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'size_Config.dart';

class CartItem extends StatelessWidget {
  CartItem({
    this.productName,this.weight,this.productPrice,this.productImage,
    Key key,
  }) : super(key: key);


  String productName;
  String weight;
  RxInt productPrice = 1200.obs;
  AssetImage productImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(() => ProductDetails(),arguments: productPrice.value);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: kM * 1.49, vertical: kM * 1.49),
        margin: EdgeInsets.only(bottom: kM * 1.49),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(kM * 0.744),
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
                      height:kM * 8.185,
                      width: kM * 8.185,
                      child: Image(
                        image: productImage,
                        width: SizeConfig.textMultiplier * 4.167,
                        height: SizeConfig.textMultiplier  * 3.909,
                      ),
                    ),

                    SizedBox(width: kM * 1.79,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productName,
                          textScaleFactor: kTSF,
                          style: kBold500.copyWith(
                            fontSize: kM * 1.71,
                          ),),
                        Text('$weight gm',
                          textScaleFactor: kTSF,
                          style: kTextStyle.copyWith(
                            fontSize: kM * 1.79,
                            color: Color(0x690E0F19),
                          ),),
                      ],
                    ),
                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Column(

                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('₦ $productPrice',
                            textScaleFactor: kTSF,
                            style: kBold500.copyWith(
                              fontSize: kM * 1.80,
                            ),),
                        ),

                        Text('₦ 1200',
                          textScaleFactor: kTSF,
                          style: kTextStyle.copyWith(
                            fontSize: kM * 1.62,
                            color: kButtonColorFade,
                            decoration: TextDecoration.lineThrough,
                          ),),
                      ],
                    ),


                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kM * 0.6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 237, 73, 67,),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: kButtonColor,
                            size: kM * 1.78,
                          ),
                        ),

                        SizedBox(width: kM * 0.744,),

                        Text('3',
                          textScaleFactor: kTSF,),

                        SizedBox(width: kM * 0.744,),

                        Container(
                          padding: EdgeInsets.all(kM * 0.6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 237, 73, 67,),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: kButtonColor,
                            size: kM * 1.78,
                          ),
                        ),
                      ],
                    )
                  ],
                ),


              ],)
          ],
        ),
      ),
    );
  }
}