import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class CardApp extends StatelessWidget {
  const CardApp({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.borderWidth = 1,
    this.color = GColors.white,
    this.outlineColor = GColors.borderSecondary,
    this.isOutlined = false,
    this.margin,
    this.padding,
    this.child,
    this.shadows,
    this.isShadow = false,
    this.onTap,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double borderWidth;
  final Color color;
  final Color outlineColor;
  final bool isOutlined;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final List<BoxShadow>? shadows;
  final bool isShadow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: isOutlined
          ? BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 10),
              ),
              border: Border.all(color: outlineColor, width: borderWidth),
              color: color,
              boxShadow: isShadow ? shadows : [],
            )
          : BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 10),
              ),
              color: color,
              boxShadow: isShadow ? shadows : [],
            ),
      child: InkWell(
        onTap: onTap,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
