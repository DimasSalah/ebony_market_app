import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

import '../../../constant/constant.dart';

enum TextFieldShape { box, line }

enum TextFieldState { focus, error, disabled, none }

class DropdownInputPrimary extends StatefulWidget {
  const DropdownInputPrimary({
    super.key,
    this.label = '',
    required this.items,
    this.value,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor = GColors.textPrimary,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.contentPadding,
    this.enable = true,
    this.validation,
    this.inputFormatters,
    this.hint = '',
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.keyboardType = TextInputType.text,
    this.maxLength = 30,
    this.onChanged,
    this.textCapitalization = TextCapitalization.sentences,
    this.obsecureText = false,
    this.inputShape = TextFieldShape.box,
    this.cursorColor = GColors.primary,
    this.textAlign = TextAlign.start,
    this.isRequired = false,
    this.requiredText = 'Required',
    this.showRequiredText = false,
    this.requiredTextStyle,
    this.isOptional = false,
    this.optitonalText = 'Optional',
    this.optionalTextStyle,
    this.labelTextStyle,
    this.outlineColor,
    this.borderRadius = 12,
    this.hintColor = GColors.textSecondary,
    this.maxLines = 1,
    this.action = TextInputAction.done,
    this.readOnly = false,
    this.onTap,
    this.errorMessage,
    this.focusNode,
    this.autoFocus = false,
    this.isDense = false,
    this.iconSize = 24,
  });

  final String label;
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Color textColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets? contentPadding;
  final bool enable;
  final String? Function(String? value)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final String hint;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorTextStyle;
  final TextInputType keyboardType;
  final int maxLength;
  final Function(String?)? onChanged;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final TextFieldShape inputShape;
  final Color cursorColor;
  final TextAlign textAlign;
  final bool isRequired;
  final String requiredText;
  final TextStyle? requiredTextStyle;
  final bool showRequiredText;
  final bool isOptional;
  final String optitonalText;
  final TextStyle? optionalTextStyle;
  final TextStyle? labelTextStyle;
  final Color? outlineColor;
  final double borderRadius;
  final Color hintColor;
  final int maxLines;
  final TextInputAction action;
  final bool readOnly;
  final Function()? onTap;
  final String? errorMessage;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool isDense;
  final double iconSize;
  @override
  _DropdownInputPrimary createState() => _DropdownInputPrimary();
}

class _DropdownInputPrimary extends State<DropdownInputPrimary> {
  late FocusNode _internalFocusNode;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _internalFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty ||
              widget.isRequired ||
              widget.isOptional) ...[
            Row(
              children: [
                if (widget.label.isNotEmpty)
                  Text(
                    widget.label,
                    style: widget.labelTextStyle ??
                        Poppins.medium.copyWith(fontSize: 12),
                  ),
                if (widget.isRequired)
                  Text(
                    '*',
                    style: Poppins.medium.copyWith(
                      fontSize: 12,
                      color: GColors.error,
                    ),
                  ),
                const Spacer(),
                if (widget.showRequiredText)
                  Text(
                    widget.requiredText,
                    style: widget.requiredTextStyle,
                  ),
                if (widget.isOptional)
                  Text(
                    widget.optitonalText,
                    style: widget.optionalTextStyle,
                  ),
              ],
            ),
            4.s,
          ],
          DropdownButtonFormField(
            icon: HeroIcon(
              HeroIcons.chevronDown,
              color: GColors.textPrimary,
              size: widget.iconSize ,
            ),
            value: widget.value,
            items: widget.items,
            focusNode: _internalFocusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              isDense: widget.isDense,
              border: widget.inputShape == TextFieldShape.box
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(widget.borderRadius)),
                      borderSide: BorderSide(
                          color: widget.outlineColor ?? Colors.transparent),
                    )
                  : null,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              enabled: widget.enable,
              fillColor: widget.color ?? GColors.white,
              filled: true,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              hoverColor: widget.outlineColor,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.outlineColor ?? Color(0xFFE9E9E9)),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              enabledBorder: widget.inputShape == TextFieldShape.box
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.outlineColor ?? Color(0xFFE9E9E9)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(widget.borderRadius)),
                    )
                  : null,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              hintText: widget.hint,
              hintStyle: widget.hintStyle ??
                  Poppins.regular.copyWith(
                    color: widget.hintColor,
                    fontSize: 14,
                  ),
              errorMaxLines: 2,
              errorStyle: widget.errorTextStyle,
              errorText: widget.errorMessage,
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 42, maxWidth: 56),
            ),
            onChanged: widget.onChanged,
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
