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

  bool? toBool() {
    if (this == null) return null;

    if (this?.toLowerCase() == "1") return true;
    if (this?.toLowerCase() == "sim") return true;
    if (this?.toLowerCase() == "yes") return true;
    if (this?.toLowerCase() == "true") return true;

    return false;
  }
}
