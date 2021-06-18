import 'package:aluta_market/Screens/AllCategories.dart';
import 'package:aluta_market/Screens/Cart.dart';
import 'package:aluta_market/Screens/Category%20Products.dart';
import 'package:aluta_market/Screens/Checkout.dart';
import 'package:aluta_market/Screens/ProductDetails.dart';
import 'package:aluta_market/Screens/Top%20Deals.dart';
import 'package:aluta_market/Utilities/size_Config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Home.dart';
import 'Screens/SubSubCategories.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future init() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
              builder: (context, orientation){
                SizeConfig().init(constraints,orientation);
                return GetMaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    // This is the theme of your application.
                    //
                    // Try running your application with "flutter run". You'll see the
                    // application has a blue toolbar. Then, without quitting the app, try
                    // changing the primarySwatch below to Colors.green and then invoke
                    // "hot reload" (press "r" in the console where you ran "flutter run",
                    // or simply save your changes to "hot reload" in a Flutter IDE).
                    // Notice that the counter didn't reset back to zero; the application
                    // is not restarted.
                    primarySwatch: Colors.red,
                    // This makes the visual density adapt to the platform that you run
                    // the app on. For desktop platforms, the controls will be smaller and
                    // closer together (more dense) than on mobile platforms.
                    visualDensity: VisualDensity.adaptivePlatformDensity,


                  ),
                  home: Home(),
                );
              });
        });
  }
}
