
import 'package:aluta_market/Controllers/AnimationController.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

class InfoHeading extends StatelessWidget {
  InfoHeading({
    Key key,
    this.document,
  }) : super(key: key);

  DocumentSnapshot document;

  // MyAnimationContoller animation = Get.put(MyAnimationContoller(

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAnimationContoller>(
      init: MyAnimationContoller(),
      builder: (controller) {
        return RichText(
                text: TextSpan(
                  style: kTextStyle.copyWith(
                    fontSize: SizeConfig.textMultiplier * 3.571,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: document['firstText']),
                    TextSpan(text: ' ${document['boldText']}', style: kBold700.copyWith(
                        fontSize: SizeConfig.textMultiplier * 3.571,
                        shadows: [
                          Shadow(
                            color: Colors.grey.shade500,
                            offset: Offset(controller.animation.value * 5,controller.animation.value* 5),
                            blurRadius: 3,
                          ),
                          Shadow(
                            color: Colors.white,
                            offset: Offset(controller.animation.value * -6,controller.animation.value * -6),
                            blurRadius: 3,
                          )
                        ]
                    )),
                    TextSpan(text: '\n${document['lastText']} '),
                  ],
                ),
              );
      }
    );
  }
}



class InfoHeadingLandscape extends StatelessWidget {
  InfoHeadingLandscape({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: kTextStyle.copyWith(
            fontSize: SizeConfig.textMultiplier * 3.571,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Get your '),
            TextSpan(text: 'groceries', style: kBold700.copyWith(
              fontSize: SizeConfig.textMultiplier * 3.071,
            )),
            TextSpan(text: ' delivered quickly '),
          ],
        ),
      ),
    );
  }
}