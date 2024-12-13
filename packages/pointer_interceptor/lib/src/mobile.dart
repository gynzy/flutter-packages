// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A [Widget] that prevents clicks from being swallowed by [HtmlElementView]s.
class PointerInterceptor extends StatelessWidget {
  /// Create a `PointerInterceptor` wrapping a `child`.
  // ignore: prefer_const_constructors_in_immutables
  PointerInterceptor({
    required this.child,
    this.intercepting = true,
    this.debug = false,
    super.key,
  });

  /// The `Widget` that is being wrapped by this `PointerInterceptor`.
  final Widget child;

  /// Whether or not this `PointerInterceptor` should intercept pointer events.
  final bool intercepting;

  /// When true, the widget renders with a semi-transparent red background, for debug purposes.
  ///
  /// This is useful when rendering this as a "layout" widget, like the root child
  /// of a `Drawer`.
  final bool debug;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return Stack(alignment: Alignment.center, children: <Widget>[
        Opacity(
          opacity: 0.01, // With 0 the work-around does not work on iOS.
          child: WebViewWidget(controller: WebViewController()),
        ),
        child,
      ]);
    } else {
      return child;
    }
  }
}
