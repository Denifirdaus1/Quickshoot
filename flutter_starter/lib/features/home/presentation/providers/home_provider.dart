import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple greeting provider for home screen
/// Demonstrates basic Riverpod usage without code generation
final homeGreetingProvider = StateProvider<String>((ref) {
  return 'Welcome to Flutter Starter!';
});

/// Example async provider pattern
final appInfoProvider = FutureProvider<String>((ref) async {
  // Simulate async operation
  await Future.delayed(const Duration(milliseconds: 500));
  return 'Flutter Starter v0.1.0';
});
