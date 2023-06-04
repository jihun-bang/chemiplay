import 'package:flutter/material.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

import 'stub.dart';

/// Renders a web-only SIGN IN button.
Widget buildSignInButton({HandleSignInFn? onPressed}) {
  return (GoogleSignInPlatform.instance as GoogleSignInPlugin).renderButton(
      configuration: GSIButtonConfiguration(
          type: GSIButtonType.icon, shape: GSIButtonShape.pill));
}
