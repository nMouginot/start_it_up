enum ObjectifStatus {
  todo,
  done,
  failed,
  blocked;

  String get label => switch (this) {
    ObjectifStatus.todo => 'À faire',
    ObjectifStatus.failed => 'Echec',
    ObjectifStatus.blocked => 'Bloqué',
    ObjectifStatus.done => 'Réussi',
  };
}
