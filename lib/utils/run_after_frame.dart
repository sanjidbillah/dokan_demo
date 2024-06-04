import 'package:flutter/material.dart';

void runAfterFrame(Function callback, {bool delay = false}) {
  // Adding a post-frame callback to the widget binding instance
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Calling the provided callback at the end of the frame
    if (delay) {
      Future.delayed(const Duration(milliseconds: 500), () {
        callback();
      });
    } else {
      callback();
    }
  });
}
