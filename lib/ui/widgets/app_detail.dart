import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/models/app_info.dart';
import '../../theme.dart';

class AppDetailContent extends StatelessWidget {
  final AppInfo app;
  final VoidCallback? onClose;
  final bool compact;
  final ScrollController? controller;

  const AppDetailContent({
    super.key,
    required this.app,
    this.onClose,
    this.compact = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding: EdgeInsets.fromLTRB(20, compact ? 12 : 24, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (onClose != null)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close_rounded, size: 18),
                color: AppColors.onSurface,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerHigh,
                  shape: const CircleBorder(),
                  side: BorderSide(
                    color: AppColors.outlineVariant.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: compact ? 48 : 64,
                height: compact ? 48 : 64,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.surfaceContainerHigh,
                      AppColors.surfaceBright,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.outlineVariant.withOpacity(0.3),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: app.iconUrl,
                  color: app.iconColor,
                  width: compact ? 24 : 30,
                  height: compact ? 24 : 30,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: AppTextStyles.headlineMd.copyWith(
                        fontSize: compact ? 16 : 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.outlineVariant.withOpacity(0.5),
                        ),
                      ),
                      child: Text(
                        app.category.toUpperCase(),
                        style: AppTextStyles.labelCaps.copyWith(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 16 : 24),
          SizedBox(
            height: compact ? 0 : 180,
            child: compact
                ? const SizedBox.shrink()
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (_, _) => const SizedBox(width: 12),
                    itemBuilder: (_, i) => Container(
                      width: 110,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.outlineVariant.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.smartphone_rounded,
                            color: AppColors.outline,
                            size: 22,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Preview ${i + 1}',
                            style: AppTextStyles.codeSm.copyWith(
                              fontSize: 10,
                              color: AppColors.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          if (!compact) const SizedBox(height: 24),
          Text(
            'ACERCA DE ESTA APP',
            style: AppTextStyles.labelCaps.copyWith(fontSize: 10),
          ),
          const SizedBox(height: 8),
          Text(
            app.description,
            style: AppTextStyles.bodyMd.copyWith(
              fontSize: compact ? 11 : 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'TECH STACK',
            style: AppTextStyles.labelCaps.copyWith(fontSize: 10),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: app.tech
                .map(
                  (t) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.outlineVariant.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      t,
                      style: AppTextStyles.codeSm.copyWith(fontSize: 10),
                    ),
                  ),
                )
                .toList(),
          ),
          if (!compact) ...[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded, size: 18),
                label: const Text('Download App'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: AppColors.onPrimaryContainer,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: AppTextStyles.headlineMd.copyWith(fontSize: 14),
                  elevation: 6,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
