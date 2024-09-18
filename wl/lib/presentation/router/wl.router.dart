import 'package:auto_route/auto_route.dart';
import 'package:wl/data/enums/pages.enum.dart';
import 'package:wl/presentation/router/wl.router.gr.dart';

@AutoRouterConfig(
  generateForDir: [
    'lib/presentation/router',
    'lib/presentation/splash',
    'lib/presentation/dashboard',
    'lib/presentation/detail',
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
          path: PagesEnum.dashboard.path,
          usesPathAsKey: true,
        ),
        AutoRoute(
          page: DetailRoute.page,
          path: PagesEnum.detail.path,
          usesPathAsKey: true,
        ),
      ];
}
