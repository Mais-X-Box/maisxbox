import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:maisxbox/domain/errors/app_base_exception.dart';
import 'package:maisxbox/utils/analytics/i_app_analytics.dart';

class AppAnalytics implements IAppAnalytics {
  late FirebaseAnalytics _analytics;
  FirebaseAnalytics get firebaseAnalytics => _analytics;

  AppAnalytics._privateConstructor() {
    this._analytics = FirebaseAnalytics();
  }
  static final instance = AppAnalytics._privateConstructor();

  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? params}) async {
    return await this._analytics.logEvent(name: name, parameters: params);
  }

  @override
  Future<void> setUserIdentifier(String userId) async {
    await firebaseAnalytics.setUserId(userId);
    if (kIsWeb) {
      await FirebaseCrashlytics.instance.setUserIdentifier(userId);
    }
  }

  @override
  Future<void> setCrashlyticsCustomKeys() async {
    try {
      // Usuario usuarioLogado = DadosMemoriaSingleton.instancia.usuarioLogado;
      // if (usuarioLogado != null) {
      //   await FirebaseCrashlytics.instance.setCustomKey("idSubscription", usuarioLogado.idSubscription ?? "");
      //   await FirebaseCrashlytics.instance.setCustomKey("idEmpresa", usuarioLogado.idEmpresa ?? "");
      //   await FirebaseCrashlytics.instance.setCustomKey("idEstabelecimento", usuarioLogado.idEstabelecimento ?? "");
      //   await FirebaseCrashlytics.instance.setCustomKey("isAnonimo", usuarioLogado.isAnonimo ?? "");
      // }
    } catch (e) {} // Colocando o try catch de propósito, pois se der algum erro ao setar as keys, mesmo assim continua o processo de logar o erro no crashlytics sem as chaves
  }

  @override
  Future setUserProperty(String name, String value) async {
    try {
      return (name.isNotEmpty) ? await _analytics.setUserProperty(name: name, value: value) : null;
    } catch (e, s) {
      logError(e, s, errorMessage: "Erro ao setar propriedade do usuário");
    }
  }

  @override
  Future<void> setUserPropertiesList(Map<String, dynamic> userProperties) async {
    if (userProperties.length > 0) {
      for (String propriedade in userProperties.keys) {
        dynamic valor = userProperties[propriedade];
        if (propriedade.isNotEmpty && valor != null) await setUserProperty(propriedade, userProperties[propriedade]);
      }
    }
  }

  @override
  Future<void> logError(dynamic exception, StackTrace stackTrace, {String? errorMessage}) async {
    if (kIsWeb) {
      try {
        dynamic _exception;
        if (exception != null && exception is Exception) {
          _exception = AppBaseException(innerException: exception, errorMessage: errorMessage);
        } else {
          _exception = exception;
        }

        await setCrashlyticsCustomKeys();
        await FirebaseCrashlytics.instance.recordError(_exception, stackTrace, reason: errorMessage);
      } catch (e) {
        print(e);
      }
    }
  }
}
