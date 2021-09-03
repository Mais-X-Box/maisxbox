class NameInitialsHelper {
  static String getNameInitials(String? completeName) {
    if ((completeName ?? "").isEmpty) return "";
    if (completeName!.length == 2) return completeName.toUpperCase();
    if (!completeName.trim().contains(" ") && completeName.length >= 2) return completeName.substring(0, 2).toUpperCase();

    List<String> nameArray = completeName.replaceAll(new RegExp(r"\s+\b|\b\s"), " ").split(" ");
    if (nameArray.length > 0 && nameArray[0].isNotEmpty) {
      // ignore: unnecessary_null_comparison
      String initials = ((nameArray[0])[0] != null ? (nameArray[0])[0] : " ") + (nameArray.length == 1 ? " " : (nameArray[nameArray.length - 1])[0]);

      return initials;
    } else
      return "";
  }
}
