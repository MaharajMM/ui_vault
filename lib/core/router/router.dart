import 'package:auto_route/auto_route.dart';
import 'package:ui_vault/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: IntroLoginRoute.page,
      path: '/intro-login',
      // path: '/',
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      // initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
      // initial: true,
    ),
    AutoRoute(
      page: SignUpRoute.page,
      path: '/sign-up',
      // initial: true,
    ),
    AutoRoute(
      page: LoginBaseRoute.page,
      path: '/base',
      children: [
        RedirectRoute(
          path: '',
          redirectTo: 'login',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: 'login',
        ),
      ],
    ),
  ];
}
