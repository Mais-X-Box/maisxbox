abstract class IAppAlertDialogWithOptions {
  final String title;
  final String message;
  final String okButtonText;
  final String cancelButtonText;

  IAppAlertDialogWithOptions(this.title, this.message, this.okButtonText, this.cancelButtonText);
  late Function show;
}
