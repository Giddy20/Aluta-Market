import 'package:get/get.dart';

class DeliveryAddress{

  RxString addressType;
  RxString address;
  RxString area;
  String city;
  String state;


  DeliveryAddress({this.addressType,this.address,this.area,this.city,this.state});

}