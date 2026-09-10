import 'package:flutter/material.dart';
import 'package:alejandro_besu/core/models/developer.dart';
import 'package:alejandro_besu/core/models/skill.dart';

final developerData = Developer(
  image: AssetImage("assets/profile.png"),
  name: "Alejandro Besú",
  description: '''
I'm a Flutter developer specializing in mobile application development, with experience building applications since 2023.

My main focus is mobile development, where I have experience building complete applications for Android and iOS — from UI design and architecture to development, backend integration, testing, and deployment to app stores.

I have worked with Firebase and its different services, including Firebase Cloud Messaging and Google Cloud tools. I currently prefer Supabase as my primary BaaS, particularly because of its PostgreSQL-based architecture and the flexibility it provides for building modern applications.

I also have experience integrating AI models directly on mobile devices, including computer vision models, embeddings, and local inference using technologies such as ONNX Runtime. I’m particularly interested in leveraging the capabilities of mobile devices to run AI locally without relying entirely on cloud services.

Although my specialty is mobile development, I can also use Flutter to build Windows desktop applications, allowing me to reuse a significant portion of an application's code and business logic when a project needs to extend beyond mobile platforms.

I can handle the entire application development lifecycle — from turning an idea into a functional design and user experience, to developing the application, integrating backend services and AI models, testing, and finally preparing and deploying it to production and the app stores.

My goal is to build complete, scalable, production-ready applications, with a strong focus on mobile and the ability to extend the same product to other platforms when needed.''',
  skills: <Skill>[
    Skill(
      icon: Icons.design_services_outlined,
      name: 'UI/UX Design',
      color: Color(0xFF9C27B0),
    ),
    Skill(
      icon: Icons.phone_android_outlined,
      name: 'Mobile Development',
      color: Color(0xFF2196F3),
    ),
    Skill(
      icon: Icons.api_outlined,
      name: 'API Integration',
      color: Color(0xFF009688),
    ),
    Skill(
      icon: Icons.auto_awesome_outlined,
      name: 'AI Integration',
      color: Color(0xFFFF9800),
    ),
    Skill(
      icon: Icons.swap_horiz_outlined,
      name: 'Native-to-Multiplatform Migration',
      color: Color(0xFF3F51B5),
    ),
    Skill(
      icon: Icons.cloud_upload_outlined,
      name: 'Deployment & Maintenance',
      color: Color(0xFF00ACC1),
    ),
  ],
  email: "mbesugarcia@gmail.com",
  telegramUser: 'alejandrobesu',
  whatsappUser: 'alejandrobesu',
);
