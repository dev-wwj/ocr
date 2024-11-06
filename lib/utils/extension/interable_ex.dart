extension InterableEx<T> on Iterable<T> {
  Iterable<T> intersperse(T separator) sync* {
    var iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while(iterator.moveNext()) {
        yield separator;
        yield iterator.current;
      }
    }
  }
}

// extension IterableExt<T> on Iterable<T> {
//   Iterable<R> mapIndexed<R, I>(IndexedMapper<T, I, R> mapper) sync* {
//     var index = 0;
//     for (final item in this) {
//       yield mapper(index++, item);
//     }
//   }
// }