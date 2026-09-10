import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:alejandro_besu/core/models/app_info.dart';
import 'package:alejandro_besu/theme.dart';

class DesktopAppIcon extends StatelessWidget {
  final AppInfo app;
  final VoidCallback onTap;
  const DesktopAppIcon({super.key, required this.app, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 66,
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.surfaceContainerHigh,
                    AppColors.surfaceContainerHighest,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: app.iconUrl,
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.7),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                app.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 8.5,
                  color: AppColors.onBackground,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
