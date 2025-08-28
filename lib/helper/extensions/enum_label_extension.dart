extension EnumLabelExtension on Enum {
  String get label {
    return name.replaceAll('_', ' ');
  }
}