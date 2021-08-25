abstract class IAppAlertDialog {
  final String title;
  final String message;
  final String okButtonText;

  IAppAlertDialog(this.title, this.message, this.okButtonText);
  late Function show;
}
