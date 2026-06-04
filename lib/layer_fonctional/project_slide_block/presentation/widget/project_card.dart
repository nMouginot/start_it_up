import 'package:flutter/material.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../domain/entity/project_slide_entry.dart';

class ProjectCard extends StatelessWidget {
  final ProjectSlideEntry entry;
  final SlideTheme theme;

  const ProjectCard({super.key, required this.entry, required this.theme});

  Color _statusColor(ObjectifStatus status) => switch (status) {
    ObjectifStatus.todo => theme.status.todoColor,
    ObjectifStatus.done => theme.status.doneColor,
    ObjectifStatus.failed => theme.status.failedColor,
    ObjectifStatus.blocked => theme.status.blockedColor,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(blurRadius: 8, color: Color(0x14000000), offset: Offset(0, 2)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ProjectCardHeader(theme: theme, projectName: entry.project.name),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final objectif in entry.objectifs)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: theme.body(color: _statusColor(objectif.status))),
                        Expanded(
                          child: Text(
                            objectif.title,
                            style: theme.body(
                              color: _statusColor(objectif.status),
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCardHeader extends StatelessWidget {
  final SlideTheme theme;
  final String projectName;

  const _ProjectCardHeader({required this.theme, required this.projectName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(color: theme.colors.primaryColor),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: ClipPath(
                clipper: _SlantedLeftClipper(),
                child: Container(
                  color: theme.colors.accentColor,
                  padding: const EdgeInsets.fromLTRB(32, 0, 16, 0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    projectName.toUpperCase(),
                    style: theme
                        .title(color: Colors.white)
                        .copyWith(
                          fontFamily: 'monospace',
                          letterSpacing: 1.2,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlantedLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
