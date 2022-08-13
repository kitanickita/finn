import 'package:finn/features/dictionary/presentation/dictionary.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String dictionary = '/';
  static const String wordInfo = '/word-info';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dictionary:
        return MaterialPageRoute(
          builder: (context) => Dictionary(),
        );

      default:
        throw const FormatException("Route not fount");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
