import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatDoubleExtension on double? {
  String formatCurrencyValue(Locale locale) {
    if (this == null) return "";

    try {
      final formatter = NumberFormat.simpleCurrency(locale: locale.languageCode);
      String totalValueFormatted = formatter.format(this);
      return totalValueFormatted;
    } catch (e) {
      return this.toString();
    }
  }

  String formatDecimalNumber(Locale locale, {maxDigits = 2}) {
    if (this == null) return "";
    try {
      final NumberFormat formatter = NumberFormat.decimalPattern(locale.languageCode);
      formatter.maximumFractionDigits = maxDigits;

      String percentageFormatted = formatter.format(this);
      return percentageFormatted;
    } catch (e) {
      return this.toString();
    }
  }
}
