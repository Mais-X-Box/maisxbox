import 'app_base_exception.dart';

class PermissionException extends AppBaseException {
  PermissionException({dynamic innerException, StackTrace? stackTrace, String? errorMessage}) : super(innerException: innerException, stackTrace: stackTrace, errorMessage: errorMessage);

  @override
  String toString() => "RemoteConfigExpiredException:\n ${super.toString()}}";
}
