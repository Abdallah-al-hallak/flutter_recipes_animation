import 'dart:math' as math;
import 'package:flutter/material.dart';

class RecipeListItemImageWrapper extends StatefulWidget {
  const RecipeListItemImageWrapper({
    super.key,
    required this.child,
    this.playOnce = false,
  });
  final Widget child;
  final bool playOnce;

  @override
  State<RecipeListItemImageWrapper> createState() =>
      _RecipeListItemImageWrapperState();
}

class _RecipeListItemImageWrapperState extends State<RecipeListItemImageWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> rotateAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 700,
        ))
      ..forward();
    scaleAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.35, 1, curve: Curves.easeOutBack),
      ),
    );
    rotateAnimation = Tween<double>(begin: 20 * math.pi / 180, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 1, curve: Curves.easeOutBack),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Transform.translate(
      offset: const Offset(20, 20),
      child: AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (context, child) {
          return Transform.scale(
            alignment: Alignment.bottomRight,
            scale: scaleAnimation.value,
            child: Transform.rotate(
              alignment: Alignment.bottomRight,
              angle: rotateAnimation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.playOnce;
}
