// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:ui_vault/features/counter/view/counter_page.dart'
    deferred as _i1;
import 'package:ui_vault/features/home/view/home_page.dart' as _i2;
import 'package:ui_vault/features/intro_login/view/intro_login_page.dart'
    as _i3;
import 'package:ui_vault/features/login/view/login_base_page.dart'
    deferred as _i4;
import 'package:ui_vault/features/login/view/login_page.dart' deferred as _i5;
import 'package:ui_vault/features/onboarding/view/onboarding_page.dart' as _i6;

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i7.PageRouteInfo<void> {
  const CounterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.CounterPage(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.IntroLoginPage]
class IntroLoginRoute extends _i7.PageRouteInfo<void> {
  const IntroLoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          IntroLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroLoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.IntroLoginPage();
    },
  );
}

/// generated route for
/// [_i4.LoginBasePage]
class LoginBaseRoute extends _i7.PageRouteInfo<void> {
  const LoginBaseRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginBaseRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(
        _i4.loadLibrary,
        () => _i4.LoginBasePage(),
      );
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(
        _i5.loadLibrary,
        () => _i5.LoginPage(),
      );
    },
  );
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingPage();
    },
  );
}
