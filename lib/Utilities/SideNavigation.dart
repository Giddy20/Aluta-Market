import 'package:aluta_market/Models/NavBarItems.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SideNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kButtonColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          GestureDetector(
            onTap: (){
              Get.back();
            },
              child:Icon(
                FontAwesomeIcons.times,
                color: Colors.white,
                size: 22,
              ),
          ),
          SizedBox(height: 38,),
          Row(
            children: [
              PhysicalModel(
                color: kWhiteColor,
                shadowColor: Color(0xFF0E0F19),
                shape: BoxShape.circle,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    child: Image.asset(
                      "images/Food.png",
                    ),

                  ),
                ),
              ),

              SizedBox(width: 15,),

              Container(
                child: Text('Mr. Gideon Aigbogun\n08032830942',
                textScaleFactor: kTSF,
                style: kBold700.copyWith(
                  fontSize: 15,
                  color: kWhiteColor
                ),),
              )

            ],
          ),

          SizedBox(height: 74,),

          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.53,
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        Get.back();
                        navigateTo(index);
                      },
                      child: Container(
                        height: 40,
                        width: 221,
                        color: Color(0x060E0F19),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(
                                navBarIcons[index],
                                color: Colors.white,
                                size: 22,
                              ),
                            ),

                            SizedBox(width: 15,),

                            Text(navBars[index],
                              textScaleFactor: kTSF,
                              style: kBold700.copyWith(
                                color: kWhiteColor,
                                fontSize: 14,
                              ),)
                          ],
                        ),
                      ),
                    ),
              itemCount: navBars.length,
              separatorBuilder: (_,__) => SizedBox(height: 7,),
            ),
          ),



          Container(
            height: 40,
            width: 221,

            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.white,
                  size: 22,
                ),

                SizedBox(width: 15,),

                Text('Logout',
                  textScaleFactor: kTSF,
                  style: kBold700.copyWith(
                    color: kWhiteColor,
                    fontSize: 14,
                  ),)
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
