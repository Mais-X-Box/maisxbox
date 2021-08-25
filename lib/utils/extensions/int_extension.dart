extension IntExtensions on int {
  String? get toMonthDescription {
    if (this <= 0 || this > 12) return "n/a";
    const Map<int, String> monthsInYear = {
      1: "Janeiro",
      2: "Fevereiro",
      3: "Março",
      4: "Abril",
      5: "Maio",
      6: "Junho",
      7: "Julho",
      8: "Agosto",
      9: "Setembro",
      10: "Outubro",
      11: "Novembro",
      12: "Dezembro",
    };
    return monthsInYear[this];
  }
}
