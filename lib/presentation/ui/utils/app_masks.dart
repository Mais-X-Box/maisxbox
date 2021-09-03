import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMasks {
  static Map<EAppMasks, MascaraApp> masks = {
    EAppMasks.celular: MascaraApp("(##) #####-####", {"#": RegExp(r'[0-9]')}),
    EAppMasks.data: MascaraApp("##/##/####", {"#": RegExp(r'[0-9]')}),
    EAppMasks.cep: MascaraApp("#####-###", {"#": RegExp(r'[0-9]')}),
    EAppMasks.cpf: MascaraApp("###.###.###-##", {"#": RegExp(r'[0-9]')}),
  };
}

enum EAppMasks { celular, data, cep, cpf }

class MascaraApp {
  final String? _maskString;
  final Map<String, RegExp> _filter;
  MaskTextInputFormatter get mask => MaskTextInputFormatter(mask: _maskString, filter: _filter);
  int get maxCharacters => (_maskString ?? "").length;

  MascaraApp(this._maskString, this._filter);
}
