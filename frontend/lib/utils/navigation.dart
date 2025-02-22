import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testflow/presentation/auth/sign_in_page.dart';
import 'package:testflow/presentation/components/components_page.dart';
import 'package:testflow/presentation/dashboard/dashboard_page.dart';
import 'package:testflow/presentation/navigation/navigation_menu.dart';
import 'package:testflow/presentation/requirements/requirement_detail_page.dart';
import 'package:testflow/presentation/requirements/requirement_list_page.dart';
import 'package:testflow/presentation/sessions/session_list_page.dart';
import 'package:testflow/presentation/settings/settings_page.dart';
import 'package:testflow/presentation/splash/splash_page.dart';
import 'package:testflow/presentation/suites/suite_list_page.dart';
import 'package:testflow/presentation/test_cases/test_case_detail_page.dart';

class Navigation {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey();

  static GoRouter get router => GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashPage.instance()),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => SignInPage.instance(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => NavigationMenu(child: child),
        routes: [
          GoRoute(
            path: '/projects/:projectId/dashboard',
            builder: (context, state) => DashboardPage.instance(),
          ),
          GoRoute(
            path: '/projects/:projectId/requirements',
            builder:
                (context, state) => RequirementListPage.instance(
                  projectId: state.pathParameters['projectId']!,
                ),
            routes: [
              GoRoute(
                path: ':requirementId',
                builder:
                    (context, state) => RequirementDetailPage.instance(
                      projectId: state.pathParameters['projectId']!,
                      requirementId: state.pathParameters['requirementId']!,
                    ),
                routes: [
                  GoRoute(
                    path: 'cases/:testCaseId',
                    builder:
                        (context, state) => TestCaseDetailPage.instance(
                          projectId: state.pathParameters['projectId']!,
                          requirementId: state.pathParameters['requirementId']!,
                          testCaseId: state.pathParameters['testCaseId']!,
                        ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/projects/:projectId/suites',
            builder: (context, state) => SuiteListPage.instance(),
          ),
          GoRoute(
            path: '/projects/:projectId/sessions',
            builder: (context, state) => SessionListPage.instance(),
          ),
          GoRoute(
            path: '/projects/:projectId/settings',
            builder: (context, state) => SettingsPage.instance(),
          ),
          GoRoute(
            path: '/projects/:projectId/components',
            builder: (context, state) => ComponentsPage.instance(),
          ),
        ],
      ),
    ],
  );

  static String location(BuildContext context) =>
      GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();

  static void signIn(BuildContext context) =>
      go(context: context, path: '/sign-in');

  static void dashboard({
    required BuildContext context,
    required String projectId,
  }) => go(context: context, path: '/projects/$projectId/dashboard');

  static void requirementList({
    required BuildContext context,
    required String projectId,
  }) => go(context: context, path: requirementListPath(projectId));

  static String requirementListPath(String projectId) =>
      '/projects/$projectId/requirements';

  static void requirementDetail({
    required BuildContext context,
    required String projectId,
    required String requirementId,
  }) => go(
    context: context,
    path: requirementDetailPath(
      projectId: projectId,
      requirementId: requirementId,
    ),
  );

  static String requirementDetailPath({
    required String projectId,
    required String requirementId,
  }) => '/projects/$projectId/requirements/$requirementId';

  static void testCaseDetail({
    required BuildContext context,
    required String projectId,
    required String requirementId,
    required String testCaseId,
  }) => go(
    context: context,
    path: '/projects/$projectId/requirements/$requirementId/cases/$testCaseId',
  );

  static void suiteList({
    required BuildContext context,
    required String projectId,
  }) => go(context: context, path: '/projects/$projectId/suites');

  static void sessionList({
    required BuildContext context,
    required String projectId,
  }) => go(context: context, path: '/projects/$projectId/sessions');

  static void settings({
    required BuildContext context,
    required String projectId,
  }) => go(context: context, path: '/projects/$projectId/settings');

  static void components({
    required BuildContext context,
    required String projectId,
  }) => go(context: context, path: '/projects/$projectId/components');

  static void go({required BuildContext context, required String path}) =>
      context.go(path);

  static void push({required BuildContext context, required String path}) =>
      context.push(path);
}
