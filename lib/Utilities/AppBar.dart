
import 'package:aluta_market/Controllers/ProductController.dart';
import 'package:aluta_market/Models/DeliveryLocations.dart';
import 'package:aluta_market/Screens/Home.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'constants.dart';

class AppBarPortrait extends StatelessWidget {

  ProductController productController = Get.put(ProductController());



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.grey.shade100,
          height: SizeConfig.heightMultiplier * 4,
          padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2.4,right: SizeConfig.heightMultiplier * 2.4, top: SizeConfig.heightMultiplier * 1, bottom: SizeConfig.heightMultiplier * 0),
          child:Column(
            children: [
              Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.bottomSheet(DeliveryLocations());
                      },
                      child: Container(
                        child: FittedBox(
                            child: Obx(() => Text('${productController.deliveryAd.value},${productController.deliveryArea.value}',
                              textScaleFactor: kTSF,
                              style: kTextStyle.copyWith(fontSize: SizeConfig.textMultiplier * 1.8,),),),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.angleDown,
                      size: SizeConfig.heightMultiplier * 1.786,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}






class AppBarLandscape extends StatelessWidget {
   AppBarLandscape({
    Key key,
  }) : super(key: key);

   ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Color(0xFFFDFDFD),
          padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2.4,right: SizeConfig.heightMultiplier * 2.4, top: SizeConfig.heightMultiplier * 1, bottom: SizeConfig.heightMultiplier * 2),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                        size: SizeConfig.heightMultiplier * 4.5,
                      ),
                      SizedBox(width: SizeConfig.heightMultiplier * 2,),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: SizeConfig.heightMultiplier * 3.5,
                              child: FittedBox(
                                  child: Text('Delivers to', style: kBold700.copyWith(fontSize: SizeConfig.textMultiplier * 2.636,),),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: SizeConfig.heightMultiplier * 2.5,
                                  child: FittedBox(
                                      child: Obx(() => Text(productController.deliveryAd.value, style: kTextStyle.copyWith(fontSize: SizeConfig.textMultiplier * 2.0,),),),
                                    fit: BoxFit.scaleDown,),
                                ),
                                Icon(
                                  FontAwesomeIcons.angleDown,
                                  size: SizeConfig.heightMultiplier * 2.086,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Icon(
                    FontAwesomeIcons.search,
                    size: SizeConfig.textMultiplier * 4.571,
                  )

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}

List<String> userDeliveryLocations = [
  'No 22, Iyana Ibigbami Street, Opp IITA',
  'No 29, Iyana Ibigbami',
  'No 32, Iyana Ibigbami',

];

class DeliveryLocations extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());

  RxString address = 'No 22 Iyana Ibigbami Street'.obs;
  String area = 'Opposite IITA';

  DeliveryLocations({this.address, this.area});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      color: kWhiteColor,
      child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              productController.deliveryAd.value = productController.deliveryLocation[index].address.value;
              productController.deliveryArea.value = productController.deliveryLocation[index].area.value;
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color(0xFFFDFDFD),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Row(
                        children: [
                          Checkbox(value: true,
                              onChanged: null),

                          Column(
                            children: [
              RichText(
              text: TextSpan(
              style: kTextStyle.copyWith(
              fontSize: SizeConfig.textMultiplier * 1.771,
                color: Colors.grey.shade600
              ),
              children: <TextSpan>[
                TextSpan(text: '${productController.deliveryLocation[index].addressType}\n',style:
                kBold500.copyWith(
                  fontSize: 15,
                ),),
                TextSpan(text: '${productController.deliveryLocation[index].address}\n'),
                TextSpan(text: '${productController.deliveryLocation[index].area} \n',),
                TextSpan(text: '${productController.deliveryLocation[index].city}\n'),
                TextSpan(text: '${productController.deliveryLocation[index].state} '),
              ],
            ),
      ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.pencilAlt,
                            color: Colors.grey.shade600,
                            size: 15,
                          ),
                          SizedBox(height: 5,),

                          Text('edit',
                          style: kTextStyle.copyWith(
                            fontSize: 12,
                            color: kButtonColorFade,
                          ),)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
      itemCount: productController.deliveryLocation.length,
        separatorBuilder: (_,__) => Divider(),
      ),
    );
  }
}



// List<DropdownMenuItem> getDeliverylocationDropdown(){
//   List<DropdownMenuItem<String>> locationDropDown = [];
//
//       for(String locations in userDeliveryLocations){
//
//         var newLocation = DropdownMenuItem(
//             child: Text(locations),
//           value: locations,
//           onTap: (){
//
//           },
//         );
//
//         locationDropDown.add(newLocation);
//
//       }
//       return locationDropDown;
// }