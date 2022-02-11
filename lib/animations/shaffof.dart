import 'package:flutter/material.dart';

class Shaffof extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;

  const Shaffof({Key? key, required this.child, required this.animationController}) : super(key: key);

  @override
  _ShaffofState createState() => _ShaffofState();
}

class _ShaffofState extends State<Shaffof> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = CurvedAnimation(parent: widget.animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }
}
