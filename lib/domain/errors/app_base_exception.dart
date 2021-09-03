class AppBaseException implements Exception {
  dynamic innerException;
  StackTrace? stackTrace;
  String? errorMessage;
  AppBaseException({this.innerException, this.stackTrace, this.errorMessage}) {
    if (this.innerException is Exception == false) {
      this.innerException = null;
    }
  }

  @override
  String toString() => "AppBaseException :\nInnerException: $innerException\nMensagem Erro: $errorMessage";
}
