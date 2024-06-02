extension ValidUserNameExtensions on String {
  bool get isValidUsername => RegExp(r'^[a-z0-9_]{4,30}$').hasMatch(this);
}
