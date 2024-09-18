import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wl/data/enums/pages.enum.dart';
import 'package:wl/data/enums/svg.enum.dart';
import 'package:wl/presentation/widgets/svg_loader.dart';

/// Name references [PagesEnum] obtained from [PagesEnum.splash.path].
@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.router.pushNamed(PagesEnum.dashboard.path),
    );
    return const Scaffold(
      body: Center(
        child: SvgLoader(SvgEnum.devotion),
      ),
    );
  }
}
