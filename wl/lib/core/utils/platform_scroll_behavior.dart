import 'package:flutter/material.dart';
import 'package:wl/data/extensions/build_context.extension.dart';

class PlatformScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    if (context.isApple) return const BouncingScrollPhysics();
    return const MaterialScrollBehavior().getScrollPhysics(context);
  }
}
