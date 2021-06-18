import 'package:aluta_market/Screens/Home.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kWhiteColor,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSuccessCircle(),


                SizedBox(height: 21,),

                Text('Order placed successfuly',
                style: kBold500.copyWith(
                  fontSize: 22,
                ),),

                SizedBox(height: 8,),

                Text('Order Id: 12309187',
                  style: kBold500.copyWith(
                    fontSize: 14,
                    color: Color(0x630E0F19),
                  ),),

                SizedBox(height: 28,),

                Text('View details',
                  style: kBold500.copyWith(
                    fontSize: 16,
                  ),),

                InkWell(
                  onTap: (){
                    Get.off(() => Home());
                  },
                  child: Container(
                    height: 45,
                    width: 213,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text('Go Home >',
                      style: kBold700.copyWith(
                        fontSize: 16,
                        color: kWhiteColor,
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomSuccessCircle extends StatelessWidget {
  const CustomSuccessCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
          height: 110,
          width: 110,
      ),
      shape: CircleBorder(),
      onPressed: null,
      fillColor: Color(0x15DC2E45),
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          height: 100,
          width: 100,
        ),
        shape: CircleBorder(),
        onPressed: null,
        fillColor: kButtonColor,
        child: Center(
          child: Icon(Icons.call_missed_outgoing_rounded,
            size: 50,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}