import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CommonFuctions {
  static blankSpace(double? height, double? width) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }

  static divider() {
    return const Divider(
      color: indigo,
      height: 0,
      thickness: 3,
    );
  }
}
