int _counter = 0;

String newSlideInstanceId() {
  _counter += 1;
  return 'sl_${DateTime.now().microsecondsSinceEpoch}_$_counter';
}
