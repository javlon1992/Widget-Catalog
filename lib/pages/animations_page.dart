import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_catalog/animations/aylantirish_3d.dart';
import 'package:widget_catalog/animations/sakratish.dart';
import 'package:widget_catalog/animations/shaffof.dart';
import 'package:widget_catalog/animations/slider.dart';
import 'package:widget_catalog/animations/yurak_urishi.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);
  static const String id = "animations_page";

  @override
  _AnimationsPageState createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// #animation_1
   //late Animation<double> _animation;

  /// #animation_2
   //late Animation<Size> _animation;

  /// #animation_3
   //late Animation<Offset> _animation;

  /// #animation_4
  //late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    /// #animation_1
    //_animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    /// #animation_2
    // _animation = Tween<Size>(begin: Size(150, 150), end: Size(200, 200))
    // .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    //
    // _controller.addStatusListener((status) {
    //   if(status == AnimationStatus.completed) {
    //     _controller.repeat();
    //   }
    // });

    /// #animation_3
    // _animation = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: Offset(1.5, 0),
    // ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

    /// #animation_4
    // _animation = Tween<double>(begin: 200.0, end: 50.0).animate(
    //   CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0, curve: Curves.elasticIn))
    // )..addStatusListener((status) {
    //   if(status == AnimationStatus.completed) {
    //     _controller.repeat(reverse: true);
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Animation"),
      ),

      /// #animation_1
      // body: Shaffof(
      //   animationController: _controller,
      //   child: const Image(
      //     height: 200,
      //     width: 200,
      //     image: AssetImage("assets/images/nature.jpg"),
      //     fit: BoxFit.cover,
      //   ),
      // ),

      /// #animation_2
      // body: YurakUrushi(
      //   animationController: _controller,
      //   child: const Image(
      //     image: AssetImage("assets/images/hotel.jpg"),
      //     fit: BoxFit.cover,
      //   ),
      // ),

      /// #animation_3
      // body: SliderAn(
      //     animationController: _controller,
      //     child: Center(child: FlutterLogo(size: 100,))
      // ),

      /// #animation_4
      // body: Sakratish(
      //   animationController: _controller,
      // child: Image(
      //   image: AssetImage("assets/images/hotel.jpg"),
      //   fit: BoxFit.cover,
      // ),
      // ),

      /// #animation_5
      body: Center(
        child: Aylantirish3D(
          animationController: _controller,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            height: 200,
              width: 200,
              child: Text("Text",style: TextStyle(fontSize: 30,color: Colors.white),)),
        ),
      ),

      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.reset();
          _controller.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}