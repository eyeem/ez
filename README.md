# ez

A wrapper class around flutter_driver API. Allows you to replace verbose calls like driver.tap(find.byValueKey("my-key")) with ez.tap("my-key")

## Getting Started

```dart
Ez ez;
FlutterDriver driver;

// Connect to the Flutter driver before running any tests.
setUpAll(() async {
  driver = await FlutterDriver.connect();
  ez = Ez(driver);
}
```

now you can write in your tests

```dart
await ez.tap("my-key");
```

while normally you would need to be slighly more verbose

```dart
await driver.tap(find.byValueKey("my-key"));
```

Additionally you can log your tap to console if you call constructor with `log: true`:

```dart
ez = Ez(driver, log: true);
```