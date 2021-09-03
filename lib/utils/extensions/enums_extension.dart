import 'package:maisxbox/utils/extensions/iterable_extension.dart';

extension ConvertEnumToString on Object {
  String enumToString() {
    try {
      return this.toString().split('.').last;
    } catch (_) {
      return "";
    }
  }
}

extension ConvertStringToEnum on String {
  T? enumFromString<T>(Iterable<T> values) {
    try {
      return values.firstWhereOrNull((type) => this == type?.enumToString());
    } catch (_) {
      return null;
    }
  }
}
