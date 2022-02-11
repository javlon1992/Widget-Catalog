import 'package:flutter/material.dart';

class Sakratish extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;

  const Sakratish({Key? key, required this.child, required this.animationController}) : super(key: key);

  @override
  _SakratishState createState() => _SakratishState();
}

class _SakratishState extends State<Sakratish> with SingleTickerProviderStateMixin{
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = Tween<double>(begin: 200.0, end: 50.0).animate(
        CurvedAnimation(parent: widget.animationController,
            curve: Interval(0.0, 1.0, curve: Curves.elasticIn))
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.animationController.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: _animation,
      builder: (context, child) {
        return Center(
          child: Container(
            alignment: Alignment.topCenter,
            //height: 150,
            // width: 150,
            margin: EdgeInsets.only(
                top: _animation.value
            ),
            child: child,
          ),
        );
      },
    );
  }
}
