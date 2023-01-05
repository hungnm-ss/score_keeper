extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool isValidEmail() {
    final RegExp _emailRegExp =
        RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}');
    return _emailRegExp.hasMatch(this);
  }

  bool isValidPhoneNumber() {
    if (startsWith('0') && length < 10) {
      return false;
    }

    /// Minimum 8 and maximum 9 numbers
    final RegExp _reg = RegExp(r'^(?=.*?[0-9]).{9,10}$');
    return _reg.hasMatch(this);
  }

  bool isValidPassword() {
    /// Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character
    final RegExp _reg = RegExp(
        '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$');
    return _reg.hasMatch(this);
  }

  bool equalsIgnoreCase(String stringCompare) {
    return toLowerCase() == stringCompare.toLowerCase();
  }
}
