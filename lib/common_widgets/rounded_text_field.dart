import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';

class RoundedTextField extends StatelessWidget {
  RoundedTextField({
    Key? key,
    this.label,
    this.hintText,
    List<Widget>? actions,
    this.margin,
    this.labelActionText,
    this.labelActionOnPressed,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.obscureText = false,
    this.error = false,
    this.errorMessage = '',
  })  : actions = actions ?? [],
        super(key: key);

  final bool enabled;
  final bool obscureText;
  final String? label;
  final String? hintText;
  final List<Widget> actions;
  final EdgeInsets? margin;
  final String? labelActionText;
  final VoidCallback? labelActionOnPressed;
  final TextEditingController? controller;
  final Function(String text)? onChanged;
  final bool error;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null || labelActionText != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label!,
                        style: GoogleFonts.poppins(
                          color: SebekColors.tertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      labelActionText == null
                          ? const SizedBox()
                          : CupertinoButton(
                              minSize: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              onPressed: labelActionOnPressed,
                              child: Text(
                                labelActionText!,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: SebekColors.accent,
                                ),
                              ),
                            ),
                    ],
                  ),
                )
              : const SizedBox(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: SebekColors.secondary,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      enabled: enabled,
                      obscureText: obscureText,
                      controller: controller,
                      onChanged: onChanged,
                      cursorWidth: 1.5,
                      cursorRadius: const Radius.circular(16),
                      style: GoogleFonts.poppins(
                        color: SebekColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintText: hintText ?? '',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: actions,
                )
              ],
            ),
          ),
          error
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: SebekColors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
