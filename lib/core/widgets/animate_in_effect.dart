import 'package:flutter/material.dart';

class AnimateIneffect extends StatefulWidget {
  const AnimateIneffect({
    Key? key,
    required this.child,
    this.intervalStart = 0,
    this.keepAlive = false,
  }) : super(key: key);

  final Widget child;
  final double intervalStart;
  final bool keepAlive;

  @override
  State<AnimateIneffect> createState() => _AnimateIneffectState();
}

class _AnimateIneffectState extends State<AnimateIneffect>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.forward(),
    );
    Curve intervalCurve = Interval(
      widget.intervalStart,
      1,
      curve: Curves.easeOut,
    );
    offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: intervalCurve,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: intervalCurve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: offsetAnimation.value,
        child: child,
      ),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
