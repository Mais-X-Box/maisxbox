import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maisxbox/presentation/ui/utils/alert_dialog/i_app_alert_dialog.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/i_navigation.dart';
import 'dart:async';

class AppAlertDialog implements IAppAlertDialog {
  final String title;
  final String message;
  final String okButtonText;

  @override
  late Function show;

  final INavigation _navigation = GetIt.instance.get<INavigation>();

  AppAlertDialog(this.title, this.message, this.okButtonText) {
    BuildContext _context = _navigation.navigatorKey.currentContext;
    this.show = () => _show(_context);
  }

  Future<void> _show(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(okButtonText),
              onPressed: () {
                _navigation.backNavigation();
              },
            ),
          ],
        );
      },
    );
  }
}
