extension ParseNumbers on String? {
  int? parseInt() {
    if (this == null) return null;
    return int.tryParse(this!);
  }

  double? parseDouble() {
    if (this == null) return null;
    return double.tryParse(this!);
  }

  String extractNumbers() {
    if (this == null) return "";

    var intRegex = RegExp("\\d+");

    if (intRegex.hasMatch(this!)) {
      return intRegex.allMatches(this!).map((m) => m[0]).join();
    } else
      return "";
  }
}
