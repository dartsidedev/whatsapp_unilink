## 2.1.0

* Use `Uri.encodeQueryComponent` to add the text instead of `Uri.encodeComponent`.
* Add support for converting `WhatsAppUnilink` to [`Uri`](https://api.dart.dev/dart-core/Uri-class.html).
* Misc: Change `pedantic` to `lints`, improve tests, documentation, and add Dart-only example code.

## 2.0.2

Fix static analysis info

> lib/whatsapp_unilink.dart:50:6 INFO: This function has a nullable return type of 'T?', but ends without returning a value.

## 2.0.1+1

* Small README change

## 2.0.1

* Update code internally (code's behavior should not change)
* Get rid of unnecessary src folder (the whole project is approx 50LoC)
* Release with GitHub Actions and tag commits automatically
* Add more thorough test cases

## 2.0.0

* Breaking: Migrate package to Dart's null safety language feature, requiring Dart 2.12 or higher.

## 1.0.0+1

Initial version.

* Support phone number and text for WhatsApp unilinks. Both number and text are optional.
