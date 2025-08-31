extension NaturalOrder on String {
  /// Natural / human sorting, case-sensitive (ASCII).
  int naturalCompareTo(String other) {
    final a = this, b = other;
    if (identical(a, b)) return 0;

    int i = 0, j = 0;
    final aLen = a.length, bLen = b.length;

    bool isDigit(int c) => c >= 48 && c <= 57; // '0'..'9'

    while (i < aLen && j < bLen) {
      final ca = a.codeUnitAt(i);
      final cb = b.codeUnitAt(j);

      final aIsDigit = isDigit(ca);
      final bIsDigit = isDigit(cb);

      if (aIsDigit && bIsDigit) {
        // --- compare digit runs as numbers ---
        final iZero = i, jZero = j;

        while (i < aLen && isDigit(a.codeUnitAt(i))) {
          i++;
        }
        while (j < bLen && isDigit(b.codeUnitAt(j))) {
          j++;
        }

        final iEnd = i, jEnd = j;

        // trim leading zeros for numeric magnitude
        var iStart = iZero;
        while (iStart < iEnd && a.codeUnitAt(iStart) == 48) {
          iStart++; // '0'
        }
        var jStart = jZero;
        while (jStart < jEnd && b.codeUnitAt(jStart) == 48) {
          jStart++; // '0'
        }

        final iLen = iEnd - iStart;
        final jLen = jEnd - jStart;

        if (iLen != jLen) return iLen < jLen ? -1 : 1;

        if (iLen == 0) {
          // both are all zeros -> fewer zeros first
          final aRun = iStart - iZero, bRun = jEnd - jZero;
          if (aRun != bRun) return aRun < bRun ? -1 : 1;
          continue;
        }

        // same effective length -> lexicographic digit compare
        for (var k = 0; k < iLen; k++) {
          final da = a.codeUnitAt(iStart + k);
          final db = b.codeUnitAt(jStart + k);
          if (da != db) return da < db ? -1 : 1;
        }

        // numeric values equal -> fewer leading zeros wins
        final aRun = iEnd - iZero, bRun = jEnd - jZero;
        if (aRun != bRun) return aRun < bRun ? -1 : 1;

        continue; // move to next chunk
      }

      // --- non-digits (or digit vs non-digit) compared bytewise, case-sensitive ---
      if (ca != cb) return ca < cb ? -1 : 1;
      i++;
      j++;
    }

    // prefix handling
    if (i < aLen) return 1;
    if (j < bLen) return -1;
    return 0;
  }
}
