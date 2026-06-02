abstract final class AppRoutes {
  static const String home = '/';
  static const String login = '/login';

  static const String projects = '/projects';
  static const String projectCreate = '/projects/new';
  static const String projectDetail = '/projects/:id';
  static const String projectEdit = '/projects/:id/edit';

  static const String objectifCreate = '/objectifs/new';
  static const String projectObjectifCreate = '/projects/:id/objectifs/new';
  static const String objectifEdit = '/objectifs/:id/edit';

  static const String slideSetup = '/presentation';
  static const String slideSetupEdit = '/presentation/:id/edit';
  static const String slideLaunch = '/presentation/:id/launch';
  static const String slideHistory = '/presentation/history';

  static String projectDetailPath(int id) => '/projects/$id';

  static String projectEditPath(int id) => '/projects/$id/edit';

  static String projectObjectifCreatePath(int projectId) =>
      '/projects/$projectId/objectifs/new';

  static String objectifEditPath(int objectifId) =>
      '/objectifs/$objectifId/edit';

  static String slideSetupEditPath(int historyEntryId) =>
      '/presentation/$historyEntryId/edit';

  static String slideLaunchPath(int historyEntryId) =>
      '/presentation/$historyEntryId/launch';
}
