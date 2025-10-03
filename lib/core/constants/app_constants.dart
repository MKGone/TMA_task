import 'package:flutter/animation.dart';

class AppConstants {
  static const double kCollapsedHeightFactor = 0.2;
  static const double kHalfHeightFactor = 0.5;
  static const double kFullHeightFactor = 1.0;

  static const double kEstimatedHeaderHeight = 60.0;
  static const double kMinWebViewHeight = 50.0;
  static const double kMinModalHeight = kEstimatedHeaderHeight + kMinWebViewHeight;

  static const Duration kModalAnimationDuration = Duration(milliseconds: 300);
  static const Curve kModalCurve = Curves.easeOut;
  static const String url = 'https://flutter.dev';
}
