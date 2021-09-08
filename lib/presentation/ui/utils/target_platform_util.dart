import 'package:flutter/foundation.dart';

class TargetPlatformUtil {
  static bool get isWebMobile => kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
}
