import 'package:flutter/material.dart';

class SlideAnimationWidget extends StatefulWidget {
  final double delay;
  final Widget child;

  const SlideAnimationWidget({super.key, required this.delay, required this.child});

  @override
  _SlideAnimationWidgetState createState() => _SlideAnimationWidgetState();
}

class _SlideAnimationWidgetState extends State<SlideAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation with the specified delay
    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      setState(() {
        _isVisible = true;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }
}
