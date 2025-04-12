import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/Password.dart';
import 'pages/Drawer/home.dart';
import 'main.dart';
import 'pages/Drawer/Calculator.dart';
import 'pages/Drawer/shell.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Shell(child: child);
      },
      routes: [
        // مسیرهای اصلی برنامه
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) {
            // دریافت شماره تلفن از extra
            final phoneNumber = state.extra as String?;
            return NoTransitionPage(child: Home(number: phoneNumber));
          },
        ),
        GoRoute(
          path: '/Calculator',
          pageBuilder:
              (context, state) => const NoTransitionPage(child: Calculator()),
        ),
      ],
    ),

    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/password',
      builder: (context, state) {
        // دریافت شماره تلفن از extra
        final phoneNumber = state.extra as String?;
        return Password(number: phoneNumber);
      },
    ),
  ],
  debugLogDiagnostics: true, // اضافه کردن این خط برای دیباگ
);
