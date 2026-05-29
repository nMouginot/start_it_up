abstract final class AppRoutes {
  static const String home = '/';
  static const String login = '/login';

  static const String projets = '/projets';
  static const String projetDetail = '/projets/:id';
  static const String sprintSetup = '/presentation';

  static const String objectifCreate = '/objectifs/new';

  static const String projetObjectifCreate = '/projets/:id/objectifs/new';

  static String projetDetailPath(int id) => '/projets/$id';

  static String projetObjectifCreatePath(int projetId) =>
      '/projets/$projetId/objectifs/new';
}
