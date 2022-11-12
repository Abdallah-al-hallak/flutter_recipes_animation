import 'package:flutter/material.dart';

class REcipeListItemTextWrapper extends StatefulWidget {
  const REcipeListItemTextWrapper({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<REcipeListItemTextWrapper> createState() =>
      _REcipeListItemTextWrapperState();
}

class _REcipeListItemTextWrapperState extends State<REcipeListItemTextWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> offsetAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
    )..forward();
    offsetAnimation =
        Tween<Offset>(begin: const Offset(0, -30), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.3,
          1,
          curve: Curves.easeOutBack,
        ),
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
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: offsetAnimation.value,
          child: child,
        );
      },
    );
  }
}
