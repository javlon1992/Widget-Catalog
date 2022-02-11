import 'package:flutter/material.dart';

class SliderAn extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;

  const SliderAn({Key? key, required this.child, required this.animationController}) : super(key: key);

  @override
  _SliderAnState createState() => _SliderAnState();
}

class _SliderAnState extends State<SliderAn> with SingleTickerProviderStateMixin{
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = Tween<Offset>(
          begin: Offset.zero,
          end: Offset(1.5, 0),
        ).animate(CurvedAnimation(parent: widget.animationController, curve: Curves.elasticIn));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
          position: _animation,
          child: widget.child
        );
  }
}
