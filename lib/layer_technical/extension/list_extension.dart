import 'dart:math';

extension RandomListItem<T> on List<T> {
  T randomElement() => this[Random().nextInt(length)];
}

extension RandomListItemFromSeed<T> on List<T> {
  T randomElementFromSeed(int seed) {
    final randomIndex = Random(seed).nextInt(length);
    return this[randomIndex];
  }
}
