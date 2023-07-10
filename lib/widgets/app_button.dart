import 'package:flutter/material.dart';

class KAppButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const KAppButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.gradient = const LinearGradient(colors: [Color(0xFFec8031), Color(0xFFcc2867)]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(6.0);
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}