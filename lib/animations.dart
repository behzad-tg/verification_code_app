
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateX}


class RoutAnimation extends StatefulWidget {
  final controller;
  final double delay;
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const RoutAnimation( this.controller, this.delay, this.child);

  @override
  _RoutAnimationState createState() => _RoutAnimationState();
}

class _RoutAnimationState extends State<RoutAnimation> {
  
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(
        AnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 200),
      )
      ..add(
        AnimationType.translateX,
        Tween(begin: 500.0, end: 0.0),
        const Duration(milliseconds: 200),
      );

    return CustomAnimation<MultiTweenValues<AnimationType>>(
      control: widget.controller,
      delay: Duration(milliseconds: (500 * widget.delay).round()),
      duration: tween.duration,
      tween: tween,
      child: widget.child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX), 0),
            child: child),
      ),
    );
  }
}