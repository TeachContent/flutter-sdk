<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Flutter SDK for Edviron Payment Gateway

<!-- ## Getting started

Generate a Collect Request Id, paste it in the input, click on the collect button -->

## Usage

```dart

String _collectRequestId = '';
final Edviron _edviron = Edviron(mode: EdvironMode.development);

_edviron.collect(
  context: context,
  collectRequestId: _collectRequestId,
  onSuccess: () => {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Collect request successful'),
      ),
    ),
  },
  onError: () => {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Collect request failed'),
      ),
    ),
  });
```
