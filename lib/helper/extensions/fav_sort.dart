extension FavSort<T> on Iterable<T> {
  List<T> sortedByFav({
    required bool Function(T) isFav,
    required String Function(T) getField,
  }) {
    final list = toList();
    list.sort((a, b) {
      final af = isFav(a);
      final bf = isFav(b);
      if (af != bf) return af ? -1 : 1;
      return getField(a).compareTo(getField(b));
    });
    return list;
  }
}
