# webview\_flutter\_wkwebview

The Apple WKWebView implementation of [`webview_flutter`][1].

## Usage

This package is [endorsed][2], which means you can simply use `webview_flutter`
normally. This package will be automatically included in your app when you do,
so you do not need to add it to your `pubspec.yaml`.

However, if you `import` this package to use any of its APIs directly, you
should add it to your `pubspec.yaml` as usual.

### iOS-specific Features

The `WebKitWebViewController` provides iOS-specific features beyond the standard webview functionality:

#### Screen Time Detection

On iOS 26.0+, you can detect if the webview is blocked by Screen Time restrictions:

```dart
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// Check if webview is blocked by Screen Time
if (controller is WebKitWebViewController) {
  final isBlocked = await controller.isBlockedByScreenTime;
  if (isBlocked) {
    // Handle Screen Time blocking, e.g., show user-friendly message
    print('Content is blocked by Screen Time restrictions');
  }
}
```

This property returns `false` on iOS versions earlier than 26.0.

### External Native API

The plugin also provides a native API accessible by the native code of iOS applications or packages.
This API follows the convention of breaking changes of the Dart API, which means that any changes to
the class that are not backwards compatible will only be made with a major version change of the
plugin. Native code other than this external API does not follow breaking change conventions, so
app or plugin clients should not use any other native APIs.

The API can be accessed by importing the native plugin `webview_flutter_wkwebview`:

Objective-C:

```objectivec
@import webview_flutter_wkwebview;
```

Then you will have access to the native class `FWFWebViewFlutterWKWebViewExternalAPI`.

## Contributing

For information on contributing to this plugin, see [`CONTRIBUTING.md`](CONTRIBUTING.md).

[1]: https://pub.dev/packages/webview_flutter
[2]: https://flutter.dev/to/endorsed-federated-plugin
