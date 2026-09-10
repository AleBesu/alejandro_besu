import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:alejandro_besu/data/librery_list.dart';
import 'package:alejandro_besu/core/models/library_info.dart';

import '../../../theme.dart';

class LibrariesView extends StatelessWidget {
  const LibrariesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.outlineVariant.withOpacity(0.3),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: FutureBuilder(
            future: getLibrarysList(),
            builder: (context, snapshot) => Column(
              children: [
                // Lista
                if (snapshot.connectionState == ConnectionState.done)
                  ...snapshot.data!.map((lib) => _LibraryTile(lib: lib)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LibraryTile extends StatelessWidget {
  final LibraryInfo lib;
  const _LibraryTile({required this.lib});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.outlineVariant.withOpacity(0.12)),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  lib.color.withOpacity(0.3),
                  lib.color.withOpacity(0.12),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.outlineVariant.withOpacity(0.2),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: lib.iconUrl,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lib.name,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  lib.description,
                  style: TextStyle(
                    fontSize: 10,
                    // fontFamily: 'JetBrainsMono',
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: lib.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: lib.color.withOpacity(0.25)),
            ),
            child: Text(
              lib.tag,
              style: TextStyle(
                fontSize: 9,
                // fontFamily: 'JetBrainsMono',
                color: lib.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
