import 'package:bookstore/common/styles/theme_structure.dart';
import 'package:flutter/material.dart';

class CustomTheme implements ThemeStructure {
  @override
  final colors = const ColorsTheme(
      darkBlue: Color(0xff3f51b5), lightBlue: Color(0xff03a9f4), white: Color(0xffffffff), black: Color(0xff000000));
}
