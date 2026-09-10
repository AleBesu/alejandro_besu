import 'package:flutter/material.dart';

class LibraryInfo {
  final String name;
  final String description;
  final String tag;
  final String iconUrl;
  final Color color;

  const LibraryInfo({
    required this.name,
    required this.description,
    required this.tag,
    required this.iconUrl,
    required this.color,
  });
}
