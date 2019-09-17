library ez;

import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';

/// wrapper class around overly verbose flutter driver and find method API
class Ez {
  Ez(this.driver, {this.log = false});

  final FlutterDriver driver;
  final bool log;

  Future<void> tap(String key, {Duration timeout}) async {
    if (log) {
      print("tapping $key...");
    }
    await driver.tap(find.byValueKey(key), timeout: timeout);
    if (log) {
      print("tapped $key");
    }
  }

  Future<void> tapBack({Duration timeout}) async {
    if (log) {
      print("tapping back...");
    }
    await driver.tap(find.pageBack(), timeout: timeout);
    if (log) {
      print("tapped back");
    }
  }

  Future<void> tapByTooltip(String key, {Duration timeout}) async {
    if (log) {
      print("tapping by tooltip $key...");
    }
    await driver.tap(find.byTooltip(key), timeout: timeout);
    if (log) {
      print("tapped by tooltip $key");
    }
  }

  Future<void> waitFor(String key, {Duration timeout}) async {
    if (log) {
      print("waiting for $key...");
    }
    await driver.waitFor(find.byValueKey(key), timeout: timeout);
    if (log) {
      print("waited for $key");
    }
  }

  Future<void> scrollIntoView(String key,
      {double alignment = 0.0, Duration timeout}) async {
    if (log) {
      print("scrolling into $key...");
    }
    await driver.scrollIntoView(find.byValueKey(key),
        alignment: alignment, timeout: timeout);
    if (log) {
      print("scrolled into $key");
    }
  }

  Future<void> scrollUntilVisible(
    String scrollable,
    String item, {
    double alignment = 0.0,
    double dxScroll = 0.0,
    double dyScroll = 0.0,
    Duration timeout,
  }) async {
    if (log) {
      print("scrolling $scrollable until $item visible...");
    }
    await driver.scrollUntilVisible(
        find.byValueKey(scrollable), find.byValueKey(item),
        alignment: alignment,
        dxScroll: dxScroll,
        dyScroll: dyScroll,
        timeout: timeout);
    if (log) {
      print("scrolled $scrollable until $item became visible");
    }
  }

  Future<String> getText(String key, {Duration timeout}) async {
    if (log) {
      print("getting text for $key...");
    }
    final value = await driver.getText(find.byValueKey(key), timeout: timeout);
    if (log) {
      print("got text for $key -> $value");
    }
    return value;
  }

  Future<void> delay(Duration delay) async {
    if (log) {
      print("waiting for $delay");
    }
    await Future<void>.delayed(delay);
  }
}
