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
    this.gradient =
        const LinearGradient(colors: [Color(0xFFec8031), Color(0xFFcc2867)]),
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

class KColorVariationButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final bool isDisabled;
  final Function(Color color)? onTap;

  const KColorVariationButton(
      {Key? key,
      this.onTap,
      this.isSelected = false,
      required this.color,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(100),
            )
          : null,
      child: InkWell(
        onTap: () {
          if(!isDisabled) onTap?.call(color);
        },
        child: CircleAvatar(
          radius: 15,
          backgroundColor: color,
          child: isDisabled ? Icon(Icons.close, size: 15.0,): null,
        ),
      ),
    );
  }
}
