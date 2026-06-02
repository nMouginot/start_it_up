sealed class SlideLauncherState {
  const SlideLauncherState();
}

class SlideLauncherLoading extends SlideLauncherState {
  const SlideLauncherLoading();
}

class SlideLauncherStarted extends SlideLauncherState {
  const SlideLauncherStarted();
}

class SlideLauncherNotFound extends SlideLauncherState {
  const SlideLauncherNotFound();
}

class SlideLauncherError extends SlideLauncherState {
  final Object error;

  const SlideLauncherError(this.error);
}
