abstract final class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String reservation = '/reservation';
  static const String reservationDetail = '/reservation/:id';

  static String reservationDetailPath(String id) => '/reservation/$id';
}
