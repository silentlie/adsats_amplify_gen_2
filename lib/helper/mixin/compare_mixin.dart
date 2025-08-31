mixin CompareMixin {
  int Function(T, T) compare<T>({
    required bool sortAscending,
    required Comparable? Function(T model) getField,
    int Function(T a, T b, bool sortAscending)? custom,
  }) {
    return (a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      final aNull = aValue == null;
      final bNull = bValue == null;
      if (aNull || bNull) {
        if (aNull && bNull) return 0;
        return aNull ? 1 : -1;
      }
      if (custom != null) {
        return custom(a, b, sortAscending);
      }
      return sortAscending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    };
  }
}
