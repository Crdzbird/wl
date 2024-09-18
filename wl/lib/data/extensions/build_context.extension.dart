import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wl/data/enums/svg.enum.dart';

extension BuildContextExtension on BuildContext {
  bool get isApple => Platform.isIOS || Platform.isMacOS;

  bool get isAndroid => Platform.isAndroid;

  bool get isDesktop =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  bool get isWeb => kIsWeb;

  Future<void> preCacheSVGs() => Future.wait(
        SvgEnum.values.map(
          (SvgEnum svg) => precacheImage(
            AssetImage(
              svg.path,
            ),
            this,
          ),
        ),
      );
}
