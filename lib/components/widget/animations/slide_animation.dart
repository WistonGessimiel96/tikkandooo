// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateX }

class SlideAnimations extends StatelessWidget {
  final double delay;
  final Widget child;
  const SlideAnimations({ Key? key, required this.delay, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final _tween = TimelineTween<AniProps>()
      ..addScene(begin: 0.milliseconds, duration: 350.milliseconds)
          .animate(
            AniProps.opacity,
            tween: 0.0.tweenTo(1.0),
          )
          .animate(
            AniProps.translateX,
            tween: (50.0).tweenTo(0.0),
            curve: Curves.easeOut,
          );*/

    final _tween = MovieTween()
      ..scene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 350))
          .tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 350))
          .tween('translateX', Tween(begin: 50.0, end: 0.0), curve: Curves.easeOut);


    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (350 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(value.get('translateX'), 0),
        child: Opacity(opacity: value.get('opacity'), child: child),
      ),
      child: child,
    );
  }
}

class SlideAnimations10 extends StatelessWidget {
  final double delay;
  final double pats;
  final Widget child;
  const SlideAnimations10({ Key? key, required this.delay, required this.child, required this.pats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final _tween = TimelineTween<AniProps>()
      ..addScene(begin: 0.milliseconds, duration: 350.milliseconds)
          .animate(
            AniProps.opacity,
            tween: 0.0.tweenTo(1.0),
          )
          .animate(
            AniProps.translateX,
            tween: (50.0).tweenTo(0.0),
            curve: Curves.easeOut,
          );*/

    final _tween = MovieTween()
      ..scene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 350))
          .tween('opacity', Tween(begin: 1.0, end: 1.0))
      ..scene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 12000))
          .tween('translateX', Tween(begin: 0.0, end: pats), curve: Curves.easeOut);


    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (350 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(value.get('translateX'), 0),
        child: Opacity(opacity: value.get('opacity'), child: child),
      ),
      child: child,
    );
  }
}
