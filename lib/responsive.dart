import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final double mobileBreakpoint;
  final double tabletBreakpoint;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.mobileBreakpoint = 850,
    this.tabletBreakpoint = 1100,
  });

  static bool isMobile(BuildContext context, {double mobileBreakpoint = 850}) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(
    BuildContext context, {
    double mobileBreakpoint = 850,
    double tabletBreakpoint = 1100,
  }) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(
    BuildContext context, {
    double tabletBreakpoint = 1100,
  }) => MediaQuery.of(context).size.width >= tabletBreakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= tabletBreakpoint) {
          return desktop ?? tablet ?? mobile;
        } else if (width >= mobileBreakpoint) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
