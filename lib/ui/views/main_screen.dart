import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moving_background/components/constellation_background.dart';
import 'package:alejandro_besu/data/developer_data.dart';
import 'package:alejandro_besu/theme.dart';
import 'package:alejandro_besu/ui/views/sections/desktop_view.dart';
import 'package:alejandro_besu/ui/views/sections/libraries_view.dart';
import 'package:alejandro_besu/ui/views/sections/mobile_view.dart';
import 'package:alejandro_besu/ui/widgets/developer_card.dart';

enum PortfolioTab { mobile, desktop, libraries }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PortfolioTab _tab = PortfolioTab.mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ConstellationBackground(
          backgroundColor: Colors.transparent,
          particleCount: (MediaQuery.of(context).size.width / 6.5).toInt(),
          maxDistance: 150.0,
          speed: 0.35,
          colors: [
            Colors.white,
            Colors.white,
            Colors.blueAccent,
            Colors.lightBlueAccent,
            Colors.greenAccent.shade100,
          ],
          maxRadius: 1.5,
          lineColor: Colors.white12,

          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'GrowNow-Software',
                        style: AppTextStyles.displayLg,
                      ),
                      const SizedBox(height: 28),
                      _PlatformToggle(
                        current: _tab,
                        onChanged: (t) => setState(() => _tab = t),
                      ),
                      const SizedBox(height: 40),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: KeyedSubtree(
                          key: ValueKey(_tab),
                          child: switch (_tab) {
                            PortfolioTab.mobile => FadeInUpBig(
                              child: const MobileView(),
                            ),
                            PortfolioTab.desktop => FadeInUpBig(
                              child: const DesktopView(),
                            ),
                            PortfolioTab.libraries => FadeInUpBig(
                              child: const LibrariesView(),
                            ),
                          },
                        ),
                      ),
                      const SizedBox(height: 48),
                      DeveloperCard(developer: developerData),
                    ],
                  ),
                ),
              ),

              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatformToggle extends StatelessWidget {
  final PortfolioTab current;
  final ValueChanged<PortfolioTab> onChanged;

  const _PlatformToggle({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _toggleBtn('Mobile', Icons.smartphone_rounded, PortfolioTab.mobile),
          _toggleBtn(
            'Desktop',
            Icons.desktop_windows_rounded,
            PortfolioTab.desktop,
          ),
          _toggleBtn('Libraries', Icons.code_rounded, PortfolioTab.libraries),
        ],
      ),
    );
  }

  Widget _toggleBtn(String label, IconData icon, PortfolioTab tab) {
    final active = current == tab;
    return InkWell(
      onTap: () => onChanged(tab),
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: active
                  ? AppColors.onPrimaryContainer
                  : AppColors.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                // fontFamily: 'JetBrainsMono',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: active
                    ? AppColors.onPrimaryContainer
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '© 2026 Mobile & Desktop Architect. Built with Precision.',
            style: TextStyle(
              // fontFamily: 'JetBrainsMono',
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 4),
          Wrap(
            children: const [
              Text(
                'GitHub',
                style: TextStyle(
                  // fontFamily: 'JetBrainsMono',
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              SizedBox(width: 18),
              Text(
                'Instagram',
                style: TextStyle(
                  // fontFamily: 'JetBrainsMono',
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              SizedBox(width: 18),
              Text(
                'Linkedln',
                style: TextStyle(
                  // fontFamily: 'JetBrainsMono',
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                ),
              ),

              SizedBox(width: 18),
              Text(
                'Youtube',
                style: TextStyle(
                  // fontFamily: 'JetBrainsMono',
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
