import 'package:flutter/widgets.dart';

class CommonContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final BoxBorder? border;
  final BlendMode? backgroundBlendMode;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  final Gradient? gradient;
  final DecorationImage? image;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const CommonContainer(
      {super.key,
      this.height = 50,
      this.width = 400,
      required this.child,
      this.border,
      this.backgroundBlendMode,
      this.borderRadius,
      this.boxShadow,
      this.color,
      this.gradient,
      this.image,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: border,
        backgroundBlendMode: backgroundBlendMode,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        color: color,
        gradient: gradient,
        image: image,
      ),
      child: child,
    );
  }
}
