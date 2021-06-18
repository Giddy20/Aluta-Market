import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'size_Config.dart';

class ProductDetailsTitle extends StatelessWidget {

  ProductDetailsTitle({
    this.productPrice,
    this.productName,
    this.productWeight,
    this.productQty,
    Key key,
  });

  int finalProductPrice = Get.arguments;
  int productPrice;
  int productQty;
  int productWeight;
  int index;
  String productName;




  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: kM * 1.49, vertical: kM * 1.49),
      margin: EdgeInsets.only(bottom: kM * 1.49),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(kM * 0.744),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(productName,
                            textScaleFactor: kTSF,
                            style: kBold500.copyWith(
                              fontSize: kM * 2.98,
                            ),),
                        ),
                      ),
                      Text('Weight: $productWeight gm',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 80,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('₦ $productPrice',
                            textScaleFactor: kTSF,
                            style: kBold700.copyWith(
                              fontSize: kM * 3.571,
                            ),),
                        ),
                      ),

                    ],
                  ),


                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          if(productQty == 1){
                            return;
                          }
                          else{
                            productQty--;
                            productPrice = (productPrice - finalProductPrice).toInt();
                            print(productPrice);
                          }
                        },
                        child: Container(
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
                      ),

                      SizedBox(width: kM * 0.744,),

                      Text(productQty.toString(),textScaleFactor: kTSF,),

                      SizedBox(width: kM * 0.744,),

                      InkWell(
                        onTap: (){
                            productQty++;
                            productPrice = (productPrice + finalProductPrice).toInt();
                            print(productPrice);
                        },
                        child: Container(
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
                      ),
                    ],
                  )
                ],
              ),


            ],)
        ],
      ),
    );
  }
}