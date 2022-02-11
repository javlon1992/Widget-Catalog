import 'package:flutter/material.dart';

class Aylantirish3D extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;

  const Aylantirish3D({Key? key, required this.child, required this.animationController}) : super(key: key);

  @override
  _Aylantirish3DState createState() => _Aylantirish3DState();
}

class _Aylantirish3DState extends State<Aylantirish3D> with SingleTickerProviderStateMixin {
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween(begin: 0.0, end: 1.0).animate(widget.animationController)..addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateX(3.14 * _animation.value),
      child: widget.child,
    );
  }
}