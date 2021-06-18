
import 'package:aluta_market/Controllers/ProductController.dart';
import 'package:aluta_market/Screens/OrderSucess.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Checkout extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  RxString orderMsg = 'Click to place order'.obs;
  Rx<Color> colorCheckBox = Colors.white.obs;
  Rx<Color> colorCheckedBox = Colors.black.obs;


  // void checkBoxColor({index}){
  //   if (index == 0) {
  //     colorCheckBox.value = kBlackColor;
  //
  //   }
  //   else if (index == 1){
  //     colorCheckBox.value = kBlackColor;
  //   }
  //   else if (index == 2){
  //     colorCheckBox.value = kBlackColor;
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(double.infinity, SizeConfig.isPortrait ? SizeConfig.heightMultiplier * 8 : SizeConfig.heightMultiplier * 9),
        child: SubAppBar(
          pageName: 'Checkout',
          info: Stack(
    children: [

      IconButton(
          icon: Icon(FontAwesomeIcons.shoppingBag,
            color: kButtonColor,
            size: 24,
          ),

          onPressed: (){}),

      Obx(() => Positioned(
          right: 8,
          top: 3,
          child: Text(productController.cartProducts.length.toString(),
            style: kBold700.copyWith(
              fontSize: 13,
              color: kButtonColor,
            ),))

      ),
          ],
    ),
    ),
    ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kM * 2.38),
        child: Container(
          child: ListView(
            children: [
              Text('Shipping to',
                textScaleFactor: kTSF,
                style: kBold500.copyWith(
                  fontSize: kTM * 2.389,
                ),),

              Container(
                child: LimitedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        productController.deliveryAd.value = productController.deliveryLocation[index].address.value;
                        productController.deliveryArea.value = productController.deliveryLocation[index].area.value;
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Row(
                                children: [
                                  CustomCheckBox(),

                                  Text('${productController.deliveryLocation[index].addressType}',
                                    textScaleFactor: kTSF,
                                    style: kBold500.copyWith(
                                    fontSize: 15,
                                  ),),
                                ],
                              ),

                              Icon(
                                FontAwesomeIcons.pencilAlt,
                                color:  Color(0x720E0F19),
                                size: 15,
                              )
                            ],),

                            Container(
                              margin: EdgeInsets.only(left: 48),
                              child: RichText(
                                text: TextSpan(
                                  style: kTextStyle.copyWith(
                                      fontSize: SizeConfig.textMultiplier * 1.771,
                                      color: kBlackColorFade,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '${productController.deliveryLocation[index].address}, '),
                                    TextSpan(text: '${productController.deliveryLocation[index].area}, ',),
                                    TextSpan(text: '${productController.deliveryLocation[index].city}\n'),
                                    TextSpan(text: '${productController.deliveryLocation[index].state} '),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: productController.deliveryLocation.length,
                  ),
                ),
              ),

              Text('Add new address',
              textScaleFactor: kTSF,
              style: kTextStyle.copyWith(
                color: kButtonColor,
                fontSize: 14,
              ),),

              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Preferred delivery time',
                  textScaleFactor: kTSF,
                  style: kBold500.copyWith(
                    fontSize: 16,
                  ),),
              ),

              Row(
                children: [
                  Container(
                    color: Color(0xFFF6F6F6),
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Date',
                                        textScaleFactor: kTSF,
                                        style: kTextStyle.copyWith(
                                        fontSize: 12
                                      ),),

                                      Text(DateFormat('EEE, LLL d').format(DateTime.now()),
                                        textScaleFactor: kTSF,
                                        style: kBold500.copyWith(
                                            fontSize: 14
                                        ),),
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  Icon(FontAwesomeIcons.angleDown,
                                  size: 14,),
                                ],
                              ),

                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Time',
                                        textScaleFactor:kTSF,
                                        style: kTextStyle.copyWith(
                                          fontSize: 12
                                      ),),
                                      Text(DateFormat('jm').format(DateTime.now()),
                                        textScaleFactor: kTSF,
                                        style: kBold500.copyWith(
                                            fontSize: 14
                                        ),)
                                    ],
                                  ),

                                  SizedBox(width: 20,),
                                  Icon(FontAwesomeIcons.angleDown,
                                    size: 14,),

                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 16),
                child: Text('Payment method',
                  style: kBold500.copyWith(
                    fontSize: 16,
                  ),),
              ),

              LimitedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                  => InkWell(
                    onTap: (){

                      if(index == 1){
                        colorCheckBox.value = Colors.black;
                      }

                      print(paymentMethods[index]);

                      // checkBoxColor(index: index);
                      print(index);
                    },
                    child: Container(
                      child: Row(
                        children: [

                          Obx(()=> CustomSquareCheckBoxUnfocused(color: colorCheckBox.value, index: index,)),

                          Text(paymentMethods[index],
                            style: kTextStyle.copyWith(
                                fontSize: 14
                            ),)
                        ],
                      ),
                    ),
                  ),
                  itemCount: paymentMethods.length,
                ),
              ),

              Container(
                child: CheckboxListTile(
                  value: false,
                  onChanged: (bool val){
                    val = true;

                    print(val);
                  },
                )
              ),


              Container(
                height: 125,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total ${productController.cartProducts.length} items in cart',
                        style: kBold500.copyWith(
                          fontSize: 14,
                        ),),

                        Text(Get.arguments.toString(),
                          style: kBold700.copyWith(
                              fontSize: kM * 2.57
                          ),)
                      ],
                    ),

                    InkWell(
                      onTap: (){
                        orderMsg.value = 'please wait...';
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                            child: Obx(()=> Text(orderMsg.value,
                              style: kBold700.copyWith(
                                  fontSize: 16,
                                  color: Colors.white
                              ),),),
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),


    );
  }
}

List paymentMethods = [
  'Cash on Delivery',
  'Credit or Debit Card',
  'Paystack',
];

paymentCheckbox(int index){
  for(String pMethods in paymentMethods){
    if(index == 1){

    }
  }
}



class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        height: 17,
        width: 17
      ),
        shape: CircleBorder(),
        onPressed: null,
    fillColor: Colors.red,
    child: RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        height: 15,
        width: 15,
    ),
      shape: CircleBorder(),
      onPressed: null,
      fillColor: Colors.white,
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          height: 10.82,
          width: 10.82
      ),
      shape: CircleBorder(),
      onPressed: null,
      fillColor: Colors.red,
      ),
      ),
    );
  }
}



class CustomCheckBoxUnfocused extends StatelessWidget {
  const CustomCheckBoxUnfocused({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
          height: 17,
          width: 17
      ),
      shape: CircleBorder(),
      onPressed: null,
      fillColor: Colors.red,
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          height: 15,
          width: 15,
        ),
        shape: CircleBorder(),
        onPressed: null,
        fillColor: Colors.white,
        child: RawMaterialButton(
          constraints: BoxConstraints.tightFor(
              height: 10.82,
              width: 10.82
          ),
          shape: CircleBorder(),
          onPressed: null,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}



class CustomSquareCheckBox extends StatelessWidget {
  const CustomSquareCheckBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
          height: 16,
          width: 16,
      ),
      onPressed: null,
      fillColor: kBlackColor,
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          height: 15,
          width: 15,
        ),
        onPressed: null,
        fillColor: Colors.white,
        child: RawMaterialButton(
          constraints: BoxConstraints.tightFor(
              height: 10,
              width: 10,
          ),
          onPressed: null,
          fillColor: kBlackColor,
        ),
      ),
    );
  }
}

class CustomSquareCheckBoxUnfocused extends StatelessWidget {
  CustomSquareCheckBoxUnfocused({
    Key key,
    this.color,this.index,
  }) : super(key: key);

  Color color;
  int index;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        height: 16,
        width: 16,
      ),
      onPressed: null,
      fillColor: kBlackColor,
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          height: 15,
          width: 15,
        ),
        onPressed: null,
        fillColor: Colors.white,
        child: RawMaterialButton(
          constraints: BoxConstraints.tightFor(
            height: 10,
            width: 10,
          ),
          onPressed: null,
          fillColor: color,
        ),
      ),
    );
  }
}
