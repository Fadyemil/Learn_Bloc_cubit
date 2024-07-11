// ignore_for_file: file_names

import 'dart:convert'; // استيراد مكتبة التحويل بين النصوص و JSON

import 'package:flutter/material.dart'; // استيراد مكتبة Flutter المخصصة لإنشاء الواجهات
import 'package:flutter/services.dart'; // استيراد مكتبة التعامل مع الموارد الثابتة

class AppLocalizations {
  Locale? locale; // المتغير الخاص بتخزين لغة التطبيق

  AppLocalizations({this.locale}); // المُنشئ لتعيين لغة التطبيق

  //~ دالة ثابتة للحصول على كائن الترجمة من السياق الحالي
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  //~ المفوض الخاص بتحميل الترجمات
  static LocalizationsDelegate<AppLocalizations> delegate =
      _ApplocalizationsDelegate();

  late Map<String, String> jsonStrings; // خريطة لتخزين الترجمات بعد تحميلها

  //~ دالة لتحميل ملف الترجمة بصيغة JSON بناءً على لغة التطبيق
  Future loadLangJson() async {
    String strings = await rootBundle.loadString(
      'assets/lang/${locale!.languageCode}.json', //~ تحميل ملف الترجمة المناسب
    );
    Map<String, dynamic> jsons = json.decode(strings); //~ تحويل النص إلى JSON
    jsonStrings = jsons.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    ); //~ تحويل JSON إلى خريطة من النصوص
  }

  //~ دالة لترجمة النصوص باستخدام المفتاح المعطى
  String translate(String key) {
    return jsonStrings[key] ??
        ''; // ~إعادة النص المترجم أو نص فارغ إذا لم يكن المفتاح موجودًا
  }
}

// المفوض الخاص بتحميل الترجمات
class _ApplocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode); //~ التحقق من دعم اللغة
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations applocalizations =
        AppLocalizations(locale: locale); // إنشاء كائن الترجمة مع اللغة المحددة
    await applocalizations.loadLangJson(); //~ تحميل ملف الترجمة
    return applocalizations; //~ إعادة كائن الترجمة بعد التحميل
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false; //~ تحديد ما إذا كان يجب إعادة تحميل الترجمات أم لا
}
