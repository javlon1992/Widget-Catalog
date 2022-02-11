import 'package:flutter/material.dart';

class YurakUrushi extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;

  const YurakUrushi({Key? key, required this.child, required this.animationController}) : super(key: key);

  @override
  _YurakUrushiState createState() => _YurakUrushiState();
}

class _YurakUrushiState extends State<YurakUrushi> with SingleTickerProviderStateMixin{
  late Animation<Size> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = Tween<Size>(begin: Size(150, 150), end: Size(200, 200))
        .animate(CurvedAnimation(parent: widget.animationController, curve: Curves.bounceIn));

    widget.animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        widget.animationController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        child: widget.child,
        animation: _animation,
        builder: (context, child) {
          return Container(
            child: child,
            height: _animation.value.height,
            width: _animation.value.width,
          );
        },
      ),
    );
  }
}
