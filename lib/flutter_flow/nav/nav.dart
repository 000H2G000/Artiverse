import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';


import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePage1Widget() : CreateAccountWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomePage1Widget()
              : CreateAccountWidget(),
        ),
        FFRoute(
          name: Auth3CreateWidget.routeName,
          path: Auth3CreateWidget.routePath,
          builder: (context, params) => Auth3CreateWidget(),
        ),
        FFRoute(
          name: Auth3LoginWidget.routeName,
          path: Auth3LoginWidget.routePath,
          builder: (context, params) => Auth3LoginWidget(),
        ),
        FFRoute(
          name: Auth3PhoneWidget.routeName,
          path: Auth3PhoneWidget.routePath,
          builder: (context, params) => Auth3PhoneWidget(),
        ),
        FFRoute(
          name: Auth3VerifyPhoneWidget.routeName,
          path: Auth3VerifyPhoneWidget.routePath,
          builder: (context, params) => Auth3VerifyPhoneWidget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Auth3ForgotPasswordWidget.routeName,
          path: Auth3ForgotPasswordWidget.routePath,
          builder: (context, params) => Auth3ForgotPasswordWidget(),
        ),
        FFRoute(
          name: FirstPageWidget.routeName,
          path: FirstPageWidget.routePath,
          builder: (context, params) => FirstPageWidget(),
        ),
        FFRoute(
          name: PurchaseFormOption2Widget.routeName,
          path: PurchaseFormOption2Widget.routePath,
          asyncParams: {
            'art': getDoc(['Artwork'], ArtworkRecord.fromSnapshot),
          },
          builder: (context, params) => PurchaseFormOption2Widget(
            art: params.getParam(
              'art',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PurchaseFormWidget.routeName,
          path: PurchaseFormWidget.routePath,
          builder: (context, params) => PurchaseFormWidget(),
        ),
        FFRoute(
          name: CartWidget.routeName,
          path: CartWidget.routePath,
          builder: (context, params) => CartWidget(),
        ),
        FFRoute(
          name: HomePage1Widget.routeName,
          path: HomePage1Widget.routePath,
          builder: (context, params) => HomePage1Widget(),
        ),
        FFRoute(
          name: EmptyCartWidget.routeName,
          path: EmptyCartWidget.routePath,
          builder: (context, params) => EmptyCartWidget(),
        ),
        FFRoute(
          name: FarvoritesPageWidget.routeName,
          path: FarvoritesPageWidget.routePath,
          builder: (context, params) => FarvoritesPageWidget(),
        ),
        FFRoute(
          name: SuccesfulPaymentWidget.routeName,
          path: SuccesfulPaymentWidget.routePath,
          builder: (context, params) => SuccesfulPaymentWidget(),
        ),
        FFRoute(
          name: QuoteGenWidget.routeName,
          path: QuoteGenWidget.routePath,
          builder: (context, params) => QuoteGenWidget(),
        ),
        FFRoute(
          name: EventMainPageWidget.routeName,
          path: EventMainPageWidget.routePath,
          builder: (context, params) => EventMainPageWidget(),
        ),
        FFRoute(
          name: CreateEventWidget.routeName,
          path: CreateEventWidget.routePath,
          builder: (context, params) => CreateEventWidget(),
        ),
        FFRoute(
          name: EventPageWidget.routeName,
          path: EventPageWidget.routePath,
          asyncParams: {
            'eventDoc': getDoc(['Event'], EventRecord.fromSnapshot),
          },
          builder: (context, params) => EventPageWidget(
            eventDoc: params.getParam(
              'eventDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: GenerateImageWidget.routeName,
          path: GenerateImageWidget.routePath,
          builder: (context, params) => GenerateImageWidget(),
        ),
        FFRoute(
          name: UpladPostWidget.routeName,
          path: UpladPostWidget.routePath,
          builder: (context, params) => UpladPostWidget(),
        ),
        FFRoute(
          name: CartCopyWidget.routeName,
          path: CartCopyWidget.routePath,
          builder: (context, params) => CartCopyWidget(),
        ),
        FFRoute(
          name: ArtWorkDetailsWidget.routeName,
          path: ArtWorkDetailsWidget.routePath,
          asyncParams: {
            'art': getDoc(['Artwork'], ArtworkRecord.fromSnapshot),
          },
          builder: (context, params) => ArtWorkDetailsWidget(
            art: params.getParam(
              'art',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ForumPageWidget.routeName,
          path: ForumPageWidget.routePath,
          builder: (context, params) => ForumPageWidget(),
        ),
        FFRoute(
          name: DiscussionWidget.routeName,
          path: DiscussionWidget.routePath,
          builder: (context, params) => DiscussionWidget(),
        ),
        FFRoute(
          name: RepliesWidget.routeName,
          path: RepliesWidget.routePath,
          builder: (context, params) => RepliesWidget(),
        ),
        FFRoute(
          name: FailedPaymentWidget.routeName,
          path: FailedPaymentWidget.routePath,
          builder: (context, params) => FailedPaymentWidget(),
        ),
        FFRoute(
          name: ReadAccountWidget.routeName,
          path: ReadAccountWidget.routePath,
          builder: (context, params) => ReadAccountWidget(),
        ),
        FFRoute(
          name: UsersEventsWidget.routeName,
          path: UsersEventsWidget.routePath,
          builder: (context, params) => UsersEventsWidget(),
        ),
        FFRoute(
          name: FactsPageWidget.routeName,
          path: FactsPageWidget.routePath,
          builder: (context, params) => FactsPageWidget(),
        ),
        FFRoute(
          name: UpdateEventPageWidget.routeName,
          path: UpdateEventPageWidget.routePath,
          builder: (context, params) => UpdateEventPageWidget(),
        ),
        FFRoute(
          name: CreateAccountWidget.routeName,
          path: CreateAccountWidget.routePath,
          builder: (context, params) => CreateAccountWidget(),
        ),
        FFRoute(
          name: UpdateAccountWidget.routeName,
          path: UpdateAccountWidget.routePath,
          builder: (context, params) => UpdateAccountWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/createAccount';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/image_2025-02-07_001418529-removebg-preview.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
