class IsEmpty {
  static bool isNotEmptyString(String s) {
    if (s.isNotEmpty)
      return true;
    else
      return false;
  }

  static bool isNotNull(Object o) {
    if (o != null)
      return true;
    else
      return false;
  }
}
