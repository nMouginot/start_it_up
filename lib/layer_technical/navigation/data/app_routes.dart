abstract final class AppRoutes {
  static const String home = '/';
  static const String login = '/login';

  static const String projets = '/projets';
  static const String projetDetail = '/projets/:id';
  static const String sprintSetup = '/presentation';

  static String projetDetailPath(int id) => '/projets/$id';
}
