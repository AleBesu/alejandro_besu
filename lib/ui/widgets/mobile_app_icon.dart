import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:alejandro_besu/core/models/app_info.dart';
import 'package:alejandro_besu/theme.dart';

class AppIcon extends StatelessWidget {
  final AppInfo app;
  final VoidCallback onTap;
  const AppIcon({super.key, required this.app, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.surfaceContainerHigh,
                  AppColors.surfaceBright,
                ],
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.outlineVariant.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CachedNetworkImage(
              imageUrl: app.iconUrl,
              width: 22,
              height: 22,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            app.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
