extension StringUtils on String? {
  bool get isNotNullAndNotEmpty => this != null && this != "";
}