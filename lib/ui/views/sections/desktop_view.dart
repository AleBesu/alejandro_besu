import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:alejandro_besu/data/desktop_apps_list.dart';
import 'package:alejandro_besu/ui/widgets/desktop_app_icon.dart';
import '../../../core/models/app_info.dart';
import '../../../theme.dart';
import '../../widgets/app_detail.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  AppInfo? _selected;

  // final _desktopIcons = const ['financier', 'fitness', 'traveler', 'eco'];
  // final _taskbarIcons = const ['console', 'system'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          children: [
            // Bisel del monitor
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF333333), width: 2),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2A2A2A),
                      Color(0xFF1A1A1A),
                      Color(0xFF222222),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 80,
                      offset: const Offset(0, 40),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: const Color(0xFF0A1628),
                    child: Stack(
                      children: [
                        // Wallpaper
                        // Positioned.fill(
                        //   child: DecoratedBox(
                        //     decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.bottomRight,
                        //         colors: [
                        //           const Color(0xFF061928),
                        //           const Color(0xFF0A2540),
                        //           AppColors.background,
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

                        Positioned.fill(
                          child: IgnorePointer(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  center: const Alignment(-0.6, -0.6),
                                  radius: 0.9,
                                  colors: [
                                    AppColors.primaryFixedDim.withOpacity(0.08),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Iconos de escritorio (arriba-izquierda)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: FutureBuilder(
                            future: getDesktopAppsList(),
                            builder: (context, asyncSnapshot) {
                              return Column(
                                children: (asyncSnapshot.data ?? []).map((app) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: FadeInUp(
                                      child: DesktopAppIcon(
                                        app: app,
                                        onTap: () =>
                                            setState(() => _selected = app),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                        // Taskbar
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 38,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF050A14).withOpacity(0.85),
                              border: Border(
                                top: BorderSide(
                                  color: Colors.white.withOpacity(0.08),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _taskbarBtn(
                                      Icons.grid_view_rounded,
                                      active: false,
                                    ),
                                    Container(
                                      width: 1,
                                      height: 20,
                                      color: Colors.white.withOpacity(0.15),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                    ),
                                    // ..._taskbarIcons.map((id) {
                                    //   final app = _byId(id);
                                    //   return _taskbarBtn(
                                    //     Icon.,
                                    //     active: id == 'console',
                                    //     onTap: () =>
                                    //         setState(() => _selected = app),
                                    //   );
                                    // }),
                                    _taskbarBtn(
                                      Icons.language_rounded,
                                      active: false,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _taskbarBtn(
                                      Icons.wifi_rounded,
                                      active: false,
                                      small: true,
                                    ),
                                    _taskbarBtn(
                                      Icons.volume_up_rounded,
                                      active: false,
                                      small: true,
                                    ),
                                    const SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${(DateTime.now().hour <= 12 ? DateTime.now().hour : ((24 - DateTime.now().hour))).toString()}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? "PM" : "AM"}',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: AppColors.onSurfaceVariant,
                                          ),
                                        ),
                                        Text(
                                          '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().padLeft(2, '0')}',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: AppColors.outline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Overlay de detalle
                        if (_selected != null)
                          Positioned.fill(
                            child: Container(
                              color: AppColors.background.withOpacity(0.93),
                              child: AppDetailContent(
                                app: _selected!,
                                compact: true,
                                onClose: () => setState(() => _selected = null),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Base del monitor
            Container(width: 60, height: 40, color: const Color(0xFF222222)),
            Container(
              width: 200,
              height: 14,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskbarBtn(
    IconData icon, {
    required bool active,
    bool small = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: small ? 26 : 32,
          height: small ? 26 : 32,
          decoration: BoxDecoration(
            color: active ? Colors.white.withOpacity(0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: small ? 14 : 17,
            color: active
                ? AppColors.primaryFixedDim
                : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
