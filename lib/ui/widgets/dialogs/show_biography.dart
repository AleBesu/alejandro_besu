import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alejandro_besu/core/models/developer.dart';
import 'package:alejandro_besu/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showBiograthyDialog(
  BuildContext context, {
  required Developer developer,
}) async => await showDialog<void>(
  context: context,
  builder: (context) => _AboutMeDialog(developer),
);

class _AboutMeDialog extends StatelessWidget {
  final Developer developer;
  const _AboutMeDialog(this.developer);

  // static const skills = [
  //   'Diseño de aplicaciones',
  //   'Desarrollo de aplicaciones',
  //   'Integración de API',
  //   'Integración de inteligencia artificial',
  //   'Migración de nativo a multiplataforma',
  //   'Despliegue y mantenimiento',
  // ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 850, maxHeight: 760),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto
                  SizedBox(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Ink(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              // fit: BoxFit.cover,
                            ),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Container(
                                        width: 500,
                                        height: 500,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              'assets/profile.png',
                                            ),
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryBlue,
                                                shape: BoxShape.circle,
                                              ),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                onTap: () =>
                                                    Navigator.of(context).pop(),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.5,
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 23,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        /////////////////////////////////////////////////////////////////
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              ///Contacts
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () async {
                                  await launchUrl(
                                    Uri.parse('mailto:${developer.email}'),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.envelope,
                                    color: Color(0xFFEA4335),
                                  ),
                                ),
                              ),

                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () async {
                                  await launchUrl(
                                    Uri.parse(
                                      'https://wa.me/${developer.whatsappUser}',
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ),

                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () async {
                                  await launchUrl(
                                    Uri.parse(
                                      'https://t.me/${developer.telegramUser}',
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.telegram,
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 24),

                  // Nombre + descripción corta
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alejandro Besú',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Flutter Developer · Mobile · AI',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          'I build complete mobile applications, '
                          'from initial design to production.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Cerrar
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Text(
                'Skills',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: developer.skills.map((skill) {
                  return Chip(
                    avatar: Icon(skill.icon, size: 16, color: skill.color),
                    label: Text(skill.name),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 36),

              Text(
                'About Me',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                developer.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 32),

              Center(
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
