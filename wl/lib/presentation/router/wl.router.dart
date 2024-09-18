import 'package:auto_route/auto_route.dart';
import 'package:wl/data/enums/pages.enum.dart';
import 'package:wl/presentation/router/wl.router.gr.dart';

@AutoRouterConfig(
  generateForDir: [
    'lib/presentation/router',
    'lib/presentation/splash',
    'lib/presentation/dashboard',
  ],
)
class WlRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: PagesEnum.splash.path,
          usesPathAsKey: true,
          keepHistory: false,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: PagesEnum.counter.path,
          usesPathAsKey: true,
        ),
      ];
}
