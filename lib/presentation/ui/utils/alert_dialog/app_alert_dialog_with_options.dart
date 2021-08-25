import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maisxbox/presentation/ui/utils/alert_dialog/i_app_alert_dialog_with_options.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/i_navigation.dart';
import 'dart:async';

enum EAppAlertDialogResult { ok, canceled }

class AppAlertDialogWithOptions implements IAppAlertDialogWithOptions {
  final String title;
  final String message;
  final String okButtonText;
  final String cancelButtonText;

  @override
  late Function show;

  final INavigation _navigation = GetIt.instance.get<INavigation>();

  AppAlertDialogWithOptions(this.title, this.message, this.okButtonText, this.cancelButtonText) {
    BuildContext _context = _navigation.navigatorKey.currentContext;
    this.show = () => _show(_context);
  }

  Future<EAppAlertDialogResult?> _show(BuildContext context) async {
    return await showDialog<EAppAlertDialogResult>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(cancelButtonText),
              onPressed: () {
                _navigation.backNavigation(EAppAlertDialogResult.canceled);
              },
            ),
            TextButton(
              child: Text(okButtonText),
              onPressed: () {
                _navigation.backNavigation(EAppAlertDialogResult.ok);
              },
            ),
          ],
        );
      },
    );
  }
}
