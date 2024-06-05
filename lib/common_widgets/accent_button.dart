import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebek_vpn/constants/colors.dart';

class AccentButton extends StatelessWidget {
  const AccentButton({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
    this.padding,
    this.expanded = false,
    this.borderRadius,
    this.loading = false,
  }) : super(key: key);

  final String text;
  final bool expanded;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: SebekColors.accent.withOpacity(.4),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16)),
          backgroundColor: SebekColors.accent,
        ),
        onPressed: loading ? null : onTap,
        child: SizedBox(
          width: expanded ? double.infinity : null,
          child: loading
              ? CupertinoActivityIndicator(color: SebekColors.primary)
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: SebekColors.primary,
                  ),
                ),
        ),
      ),
    );
  }
}
