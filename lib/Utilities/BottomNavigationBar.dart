import 'package:aluta_market/Controllers/ProductController.dart';
import 'package:aluta_market/Controllers/ProfileContoller.dart';
import 'package:aluta_market/Screens/Cart.dart';
import 'package:aluta_market/Screens/Home.dart';
import 'package:aluta_market/Screens/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'constants.dart';

class BottomNavigation extends StatelessWidget {

  final ProfileController profileController = Get.put(ProfileController());
  final ProductController productController = Get.put(ProductController());

  @override

  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (s) => Container(
        height: 70,
        child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search),  label: 'Search'),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.shoppingBag),  label: 'Cart',activeIcon: Obx(() => Text('${productController.cartProducts.length} Items', style: kTextStyle.copyWith(
                  fontSize: 11,
                  color: kButtonColor
              ),),),),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.history), label: 'History'),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.male), label: 'Profile'),
            ],

            currentIndex: profileController.selectedIndex,
            selectedItemColor: kBlackColor,
            unselectedItemColor: Colors.grey.shade400,
            iconSize: 20,
            showUnselectedLabels: true,
            selectedLabelStyle: kTextStyle,
            unselectedLabelStyle: kTextStyle,
            onTap: (index) {
              profileController.onItemTapped(index);
              if(index == 0){
                Get.off(() => Home());
              }
              else if(index == 2){
                Get.off(() => Cart());
              }
              else  if(index == 4){
                Get.off(() => UserProfile());
              }
            }
        ),
      ),

    );
  }
}

class ProfileController extends GetxController{

  final _selectedIndex = 0.obs;
  set selectedIndex(value) => this._selectedIndex.value = value;
  get selectedIndex => this._selectedIndex.value;

  void onItemTapped (int index){
    this.selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}
