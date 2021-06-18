import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MyAnimationContoller extends GetxController with SingleGetTickerProviderMixin{
  AnimationController _animationController;
  Animation _animation;
  Animation get animation => this._animation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    _animationController.repeat(reverse: true);


  }
}