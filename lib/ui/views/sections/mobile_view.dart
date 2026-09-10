import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:alejandro_besu/data/mobile_app_list.dart';
import 'package:alejandro_besu/ui/widgets/mobile_app_icon.dart';
import '../../../core/models/app_info.dart';
import '../../../theme.dart';
import '../../widgets/app_detail.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  void _openApp(BuildContext context, AppInfo app) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface.withOpacity(0.97),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) => AppDetailContent(
          app: app,
          controller: controller,
          onClose: () => Navigator.pop(ctx),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340),
        child: AspectRatio(
          aspectRatio: 9 / 19.5,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.surfaceContainerHighest,
                  AppColors.surfaceContainerLow,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 50,
                  offset: const Offset(0, 25),
                ),
              ],
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: AppColors.surfaceContainerHighest,
                child: Stack(
                  children: [
                    // Wallpaper degradado (reemplaza la imagen del original)
                    // Positioned.fill(
                    //   child: DecoratedBox(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topCenter,
                    //         end: Alignment.bottomCenter,
                    //         colors: [
                    //           AppColors.primaryContainer.withOpacity(0.18),
                    //           AppColors.surface,
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned.fill(
                      child: MovingBackground.cyberpunk(
                        duration: Duration(seconds: 20),
                        animationType: AnimationType.scale,
                      ),
                    ),
                    // Isla dinámica + status bar
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 22,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 22,
                      right: 22,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '9:41',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.signal_cellular_alt_rounded,
                                size: 12,
                                color: AppColors.onSurface,
                              ),
                              SizedBox(width: 3),
                              Icon(
                                Icons.wifi_rounded,
                                size: 12,
                                color: AppColors.onSurface,
                              ),
                              SizedBox(width: 3),
                              Icon(
                                Icons.battery_full_rounded,
                                size: 12,
                                color: AppColors.onSurface,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Contenido: buscador + grilla
                    Positioned(
                      top: 56,
                      left: 16,
                      right: 16,
                      bottom: 96,
                      child: Column(
                        children: [
                          Container(
                            height: 38,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: AppColors.surface.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.outlineVariant.withOpacity(
                                  0.3,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  size: 16,
                                  color: AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Search projects...',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.onSurfaceVariant
                                        .withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 22),
                          Expanded(
                            child: FutureBuilder(
                              future: getMobileAppsList(),
                              builder: (context, snapshot) => GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    snapshot.connectionState ==
                                        ConnectionState.done
                                    ? snapshot.data!.length
                                    : 0,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 18,
                                      crossAxisSpacing: 6,
                                      childAspectRatio: 0.75,
                                    ),
                                itemBuilder: (_, i) {
                                  final app = snapshot.data![i];
                                  return FadeInUp(
                                    child: AppIcon(
                                      app: app,
                                      onTap: () => _openApp(context, app),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Dock
                    Positioned(
                      bottom: 16,
                      left: 8,
                      right: 8,
                      child: Container(
                        height: 76,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.surface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.outlineVariant.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _dockIcon(Icons.call_rounded, AppColors.secondary),
                            _dockIcon(Icons.mail_rounded, AppColors.primary),
                            _dockIcon(
                              Icons.chat_bubble_rounded,
                              AppColors.tertiaryFixedDim,
                            ),
                            _dockIcon(
                              Icons.camera_alt_rounded,
                              AppColors.onSurfaceVariant,
                              filled: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.onSurface.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dockIcon(IconData icon, Color color, {bool filled = false}) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: filled
            ? AppColors.surfaceContainerHighest
            : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(14),
        border: filled
            ? Border.all(color: AppColors.outlineVariant.withOpacity(0.2))
            : null,
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
