import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation({ Key? key, required this.delay, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(
          begin: const Duration(milliseconds: 150),
          end: const Duration(milliseconds: 350))
          .tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(
          begin: const Duration(milliseconds: 150),
          end: const Duration(milliseconds: 350))
          .tween('translateY', Tween(begin: -30.0, end: 0.0), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (350 * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, value, child ) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.translate(
            offset: Offset(0, value.get('translateY')), child: child),
      ),
      child: child,
    );
  }
}
