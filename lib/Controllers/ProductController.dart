import 'package:aluta_market/Models/CartProducts.dart';
import 'package:aluta_market/Models/DeliveryLocations.dart';
import 'package:aluta_market/Models/NavBarItems.dart';
import 'package:aluta_market/Models/PopularProducts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class ProductController extends GetxController {


var popularProducts = List<PopularProductsList>().obs;
var cartProducts = List<CartProducts>().obs;
var deliveryLocation = List<DeliveryAddress>().obs;

var deliveryAd = 'No 22, Iyana Ibigbami'.obs;
var deliveryArea = 'Ibadan'.obs;

void updateAd(int index){
  this.deliveryAd = deliveryLocation[index].address;
  print(deliveryAd);
  update();
}

// getData() async{
//  return await FirebaseFirestore.instance.collection('products').get();
// }
//
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(popularProducts.isNotEmpty == true){

    }
  }

}
