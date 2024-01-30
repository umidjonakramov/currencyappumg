// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "calculate": "Calculate",
  "currency": "Currency",
  "uzbek": "Uzbek",
  "english": "English",
  "russian": "Russian"
};
static const Map<String,dynamic> ru = {
  "calculate": "Рассчитать",
  "currency": "Валюта",
  "uzbek": "Узбекский",
  "english": "Англичкий",
  "russian": "Русский"
};
static const Map<String,dynamic> uz = {
  "calculate": "Hisoblash",
  "currency": "Valyuta",
  "uzbek": "O`zbekcha",
  "english": "Inglizcha",
  "russian": "Ruscha"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru, "uz": uz};
}
