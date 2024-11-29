// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:maouenepay_admin/views/admins/add_admin.dart';
import 'package:maouenepay_admin/views/admins/admin_details.dart';
import 'package:maouenepay_admin/views/agents/add_agent.dart';
import 'package:maouenepay_admin/views/agents/agent_details.dart';
import 'package:maouenepay_admin/views/auth/login.dart';
import 'package:maouenepay_admin/views/auth/splash.dart';
import 'package:maouenepay_admin/views/business_management/add_business.dart';
import 'package:maouenepay_admin/views/business_management/business_details.dart';
import 'package:maouenepay_admin/views/sidebar/sidebar.dart';
import 'package:maouenepay_admin/views/users/add_user.dart';
import 'package:maouenepay_admin/views/users/user_details.dart';

class AppRoutes {
  static const SPLASH = '/';
  static const SIDEBAR = '/sidebar';
  static const DASHBOARD = '/dashboard';
  static const LOGIN = '/login';
  static const USER_DETAIL = '/userdetail';
  static const ADD_USER = '/adduser';
  static const BUSINESS_DETAILS = '/businessdetails';
  static const ADD_BUSINESS = '/addbusiness';
  static const ADD_ADMIN = '/addadmin';
  static const ADMIN_DETAILS = '/admindetails';
  static const ADD_AGENT = '/addagent';
  static const AGENT_DETAILS = '/agentdetails';

  static final GoRouter _router = GoRouter(
    initialLocation: SPLASH,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        name: SPLASH,
        path: SPLASH,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        name: LOGIN,
        path: LOGIN,
        builder: (context, state) {
          return const Login();
        },
      ),
      GoRoute(
        name: SIDEBAR,
        path: SIDEBAR,
        builder: (context, state) => const CustomSidebar(),
      ),
      GoRoute(
        name: USER_DETAIL,
        path: USER_DETAIL,
        builder: (context, state) => const UserDetail(),
      ),
      GoRoute(
        name: ADD_USER,
        path: ADD_USER,
        builder: (context, state) => const AddUser(),
      ),
      GoRoute(
        name: BUSINESS_DETAILS,
        path: BUSINESS_DETAILS,
        builder: (context, state) => const BusinessDetails(),
      ),
      GoRoute(
        name: ADD_BUSINESS,
        path: ADD_BUSINESS,
        builder: (context, state) => const AddBusiness(),
      ),
      GoRoute(
        name: ADMIN_DETAILS,
        path: ADMIN_DETAILS,
        builder: (context, state) => const AdminDetail(),
      ),
      GoRoute(
        name: ADD_ADMIN,
        path: ADD_ADMIN,
        builder: (context, state) => const AddAdmin(),
      ),
      GoRoute(
        name: AGENT_DETAILS,
        path: AGENT_DETAILS,
        builder: (context, state) => const AgentDetails(),
      ),
      GoRoute(
        name: ADD_AGENT,
        path: ADD_AGENT,
        builder: (context, state) => const AddAgent(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
