import 'package:flutter/material.dart';

class AppInfo {
  final String id;
  final String name;
  final String category;
  final String iconUrl;
  final Color iconColor;
  final String description;
  final List<String> tech;

  const AppInfo({
    required this.id,
    required this.name,
    required this.category,
    required this.iconUrl,
    required this.iconColor,
    required this.description,
    required this.tech,
  });
}
