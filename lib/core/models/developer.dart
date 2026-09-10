import 'package:flutter/material.dart';
import 'package:alejandro_besu/core/models/skill.dart';

class Developer {
  final AssetImage image;
  final String name;
  final List<Skill> skills;
  final String description;
  final String email;
  final String telegramUser;
  final String whatsappUser;

  Developer({
    required this.image,
    required this.name,
    required this.skills,
    required this.description,
    required this.email,
    required this.telegramUser,
    required this.whatsappUser,
  });
}
