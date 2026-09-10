import 'package:flutter/material.dart';
import 'package:alejandro_besu/core/models/developer.dart';
import 'package:alejandro_besu/theme.dart';
import 'package:alejandro_besu/ui/widgets/dialogs/show_biography.dart';

class DeveloperCard extends StatelessWidget {
  final Developer developer;
  const DeveloperCard({super.key, required this.developer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),

      onTap: () async {
        await showBiograthyDialog(context, developer: developer);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow.withOpacity(0.7),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryContainer.withOpacity(0.3),
                    AppColors.secondary.withOpacity(0.2),
                  ],
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.outlineVariant.withOpacity(0.4),
                ),
                image: DecorationImage(
                  image: const AssetImage('assets/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  developer.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Mobile & Desktop Dev',
                  style: TextStyle(
                    // fontFamily: 'JetBrainsMono',
                    fontSize: 10,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
