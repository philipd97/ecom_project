import 'package:flutter/material.dart' show TextStyle, FontWeight, EdgeInsets;

import 'package:sizer/sizer.dart';
import '../gen/colors.gen.dart';

const blueTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: ColorName.blueBase,
);

final sidePadding = 8.5.w;

final buttonPadding = EdgeInsets.only(
  left: sidePadding,
  right: sidePadding,
  bottom: 2.h,
);
