import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../loadings/loading_indicator.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.onPressed,
    this.child,
    this.loadingColor = Colors.white,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.fullWidth = false,
    this.elevation = 0,
    this.isLoading = false,
    this.loadingWidget,
    this.color = GColors.primary,
    this.textColor,
    this.icon,
    this.suffixIcon,
    this.onLongPressed,
    this.alignment,
    this.borderSide,
    this.text = 'Button',
    this.enable = true,
    this.borderRadius = 10,
    this.isOutline = false,
    this.outlineColor,
    this.textStyle,
  });

  ///receive a ValueNotifier to indicate a loading widget
  final bool isLoading;
  final bool enable;

  ///
  final Widget? child;
  final String text;
  final TextStyle? textStyle;

  ///An icon to show at before [child]
  final Widget? icon;
  final Widget? suffixIcon;

  ///
  final VoidCallback? onPressed;

  ///
  final Function? onLongPressed;

  //
  final double? elevation;

  ///Button's background Color
  final Color color;

  ///Text's color for a child that usually a Text
  final Color? textColor;

  ///Loading indicator's color, default is white
  final Color loadingColor;

  ///A widget to show when loading, if the value is null,
  ///it will use a loading widget from SuraProvider or CircularProgressIndicator
  final Widget? loadingWidget;

  ///Button's margin
  final EdgeInsets margin;

  ///Button's padding
  final EdgeInsets padding;

  ///child's alignment
  final MainAxisAlignment? alignment;

  ///if [fullWidth] is `true`, Button will take all remaining horizontal space
  final bool fullWidth;

  ///
  final BorderSide? borderSide;
  final double borderRadius;
  final bool isOutline;
  final Color? outlineColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: fullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      margin: margin,
      child: ElevatedButton(
        onPressed: isLoading
            ? () {}
            : enable
                ? onPressed
                : null,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: isOutline
              ? Colors.transparent
              : isLoading
                  ? color.withOpacity(.4)
                  : color,
          shape: isOutline
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  side: BorderSide(color: outlineColor ?? color),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
          padding: padding,
          elevation: isLoading || isOutline ? 0 : elevation,
          side: borderSide,
        ),
        child: Visibility(
          visible: isLoading,
          replacement: Row(
            mainAxisAlignment: alignment ?? MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) ...[
                icon ?? const SizedBox(),
                8.s,
              ],
              Padding(
                padding: const EdgeInsets.all(12),
                child: child ??
                    Text(
                      text,
                      style: textStyle ??
                          Poppins.regular.copyWith(
                            color: textColor ?? Colors.white,
                            fontSize: 14,
                          ),
                    ),
              ),
              if (suffixIcon != null) ...[
                8.s,
                suffixIcon ?? const SizedBox(),
              ],
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: LoadingIndicator(
              key: Key('loadingButton'),
            ),
          ),
        ),
      ),
    );
  }
}
