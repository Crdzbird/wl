import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wl/data/enums/svg.enum.dart';

class SvgLoader extends StatelessWidget {
  const SvgLoader(
    SvgEnum svgEnum, {
    super.key,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
    Color? color,
  })  : _svgEnum = svgEnum,
        _height = height,
        _width = width,
        _fit = fit,
        _color = color;

  final SvgEnum _svgEnum;
  final double? _height;
  final double? _width;
  final BoxFit _fit;
  final Color? _color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        _svgEnum.path,
        height: _height,
        width: _width,
        excludeFromSemantics: true,
        fit: _fit,
        colorFilter:
            _color != null ? ColorFilter.mode(_color, BlendMode.srcIn) : null,
        placeholderBuilder: (context) =>
            const CircularProgressIndicator.adaptive(),
      );
}
