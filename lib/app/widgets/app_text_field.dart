import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.w,
    required this.controller,
    required this.hintText,
    this.inp = const [],
    this.enabled = true,
    this.height = 45,
    this.validator,
    this.maxLines = 1,
    this.charLimit,
    this.lebel = '',
    this.isIcon = false,
    required this.textInputType,
    this.onTap,
    this.hasLeftPadding = false,
  }) : super(key: key);

  final double? w;
  final TextEditingController controller;
  final TextInputType textInputType;
  final List<TextInputFormatter> inp;
  final String lebel;
  final String hintText;
  final bool enabled;
  final double height;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? charLimit;
  final bool isIcon;
  final void Function()? onTap;
  final bool hasLeftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 2, bottom: 2, left: hasLeftPadding ? 25 : 0),
      child: SizedBox(
        width: w,
        child: TextFormField(
          maxLines: maxLines,
          maxLength: charLimit,
          controller: controller,
          inputFormatters: inp,
          validator: validator,
          enabled: enabled,
          keyboardType: textInputType,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
          ),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: GoogleFonts.padauk().fontFamily,
              fontSize: 19,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
