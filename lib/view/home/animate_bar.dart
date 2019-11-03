import 'package:flutter/material.dart';

class AnimateBar extends StatelessWidget {
  final bool display;
  final Widget child;
  AnimateBar({this.display = true, this.child});
  @override
  Widget build(BuildContext context) {
    return AnimateScaleBar(child: display ? child : SizedBox.shrink());
  }
}

class AnimateScaleBar extends StatelessWidget {
  final Widget child;
  AnimateScaleBar({this.child});
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
      child: child,
    );
  }
}
