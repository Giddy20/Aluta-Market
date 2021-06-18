import 'dart:io';

import 'package:aluta_market/Utilities/BottomNavigationBar.dart';
import 'package:aluta_market/Utilities/SubAppBar.dart';
import 'package:aluta_market/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'Home.dart';


class UserProfile extends StatelessWidget {

  Rx<IconData> iconToggle = FontAwesomeIcons.angleRight.obs;



  Rx<File> image;

  final picker = ImagePicker();

  // void getImage(ImageSource source) {
  //   final pickedFile = picker.getImage(source: source);
  //   if(pickedFile != null){
  //     image.value = File(pickedFile.path);
  //   }
  //   else{
  //     print('No Image Selected');
  //   }
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: (){
                Get.off(() => Home());
              },
              child: Icon(
                FontAwesomeIcons.angleLeft,
                color: kBlackColor,
              ),
            ),
            title: Text('User Profile',
                style: kBold500.copyWith(color: kBlackColor, fontSize: 24)),
            backgroundColor: Colors.grey.shade50,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.bottomSheet(
                          ImagePicker(),
                      backgroundColor: Colors.transparent);
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: kBlackColor,
                          child: Icon(Icons.fifteen_mp),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: PhysicalModel(
                            shape: BoxShape.circle,
                            color: kButtonColor,
                            child: CircleAvatar(
                              radius: 13.0,
                              child: Icon(Icons.camera),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12,),

                  Text('Aigbogun Gideon Dideoluwa',
                    style: kBold700.copyWith(
                        color: kBlackColor,
                        fontSize: 18
                    ),),

                  SizedBox(height: 21,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('25',
                            style: kBold500.copyWith(
                              fontSize: 16,
                              color: kBlackColor,
                            ),),
                          Text('Orders',
                            style: kBold500.copyWith(
                              fontSize: 12,
                              color: Colors.black26,
                            ),),
                        ],
                      ),

                      SizedBox(width: 60,),

                      Column(
                        children: [
                          Text('125',
                            style: kBold500.copyWith(
                              fontSize: 16,
                              color: kBlackColor,
                            ),),
                          Text('Aluta Points',
                            style: kBold500.copyWith(
                              fontSize: 12,
                              color: Colors.black26,
                            ),),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 40,)

                ],
              ),
            ),

          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context,index) => ExpansionTile(
                    onExpansionChanged: (bool open){
                      print(open);
                      if(open == true){
                        iconToggle.value = FontAwesomeIcons.angleDown;
                      }
                      else{
                        iconToggle.value = FontAwesomeIcons.angleRight;
                      }
                    },
                    leading: Icon(profileOptionsIcon[index],color: kBlackColor,),
                    title: Text(profileOptions[index],
                      style: kBold500.copyWith(
                          fontSize: 16
                      ),),
                    children: [
                      profileWidgets[index]
                    ],

                    trailing: Obx(() => Icon(iconToggle.value,color: kBlackColor,)),
                  ),
                childCount: profileOptions.length
              )),
        ],
      ),
        bottomNavigationBar: BottomNavigation(),
    );
  }
}

List toggle = [
  FontAwesomeIcons.angleDown.obs,
  FontAwesomeIcons.angleDown.obs,
  FontAwesomeIcons.angleDown.obs,
];

List profileOptions = [
  'General Info',
  'Change Password',
  'Select Default Payment card'
];

List profileOptionsIcon = [
  FontAwesomeIcons.user,
  FontAwesomeIcons.userLock,
  FontAwesomeIcons.creditCard,
];

List profileWidgets = [
  Column(
    children: [
      ListTile(
        title: Text('Mobile Number',
            style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
            ),),
        subtitle:   Text('+2348032830942',
                style: kBold500.copyWith(
                  fontSize: 14
                ),),

      ),

      ListTile(
        title: Text('Address',
          style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
          ),),
        subtitle:   Text('Integrity Lodge, Apatapiti, FUTA Southgate',
          style: kBold500.copyWith(
              fontSize: 14
          ),),

      ),

      ListTile(
        title: Text('Email Address',
          style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
          ),),
        subtitle:   Text('aigbogungideon@gmail.com',
          style: kBold500.copyWith(
              fontSize: 14
          ),),

      ),
    ],
  ),

  Column(
    children: [
      ListTile(
        title: Text('Card 1',
          style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
          ),),
        subtitle:   Text('4486 - 4521 - 9865 - 7458',
          style: kBold500.copyWith(
              fontSize: 14
          ),),

      ),

      ListTile(
        title: Text('Card 2',
          style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
          ),),
        subtitle:   Text('4486 - 4521 - 9865 - 7458',
          style: kBold500.copyWith(
              fontSize: 14
          ),),

      ),
    ],
  ),



  Column(
    children: [
      ListTile(
        title: Text('Payment Card 1',
          style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
          ),),
        subtitle:   Text('4486 - 4521 - 9865 - 7458',
          style: kBold500.copyWith(
              fontSize: 14
          ),),

        trailing: Image.network('https://banner2.cleanpng.com/20180821/jpy/kisspng-mastercard-logo-credit-card-maestro-payment-card-mastercard-mastercard-logo-design-vector-free-down-5b7bd9c7c83ef0.9372206915348433358202.jpg'),
      ),

      ListTile(
        title: Text('Payment Card 2',
          style: kTextStyle.copyWith(
              color: Colors.black26,
              fontSize: 12
          ),),
        subtitle:   Text('4486 - 4521 - 9865 - 7458',
          style: kBold500.copyWith(
              fontSize: 14
          ),),
        
        trailing: Image.network('https://img.favpng.com/4/21/8/visa-debit-card-credit-card-logo-mastercard-png-favpng-F1N2V7uXBDyLr2VKwfUmRpad9.jpg'),

      ),
    ],
  )


];

class ImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Text('Pick an Image',
                style: kBold500.copyWith(
                    fontSize: 22
                ),),
            ),
          ),
          Divider(),


          InkWell(
            onTap: (){
             // getImage(context:context ,source: ImageSource.camera);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt_outlined,color: kBlackColor,size: 30,),
                SizedBox(width: 10,),
                Text('Camera',
                style: kBold500.copyWith(
                  fontSize: 20
                ),),
              ],
            ),
          ),

          Divider(),

          InkWell(
            onTap: (){
              // getImage(context:context ,source: ImageSource.gallery);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera,color: kBlackColor,size: 30,),
                  SizedBox(width: 10,),
                  Text('Gallery',
                    style: kBold500.copyWith(
                        fontSize:20
                    ),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }






}
