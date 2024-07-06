import 'package:connectivity_changetheme_localization/data%20layer/helper/lang/appLocalizations.dart';
import 'package:connectivity_changetheme_localization/presentation%20layer/screen/MyHomePage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class materApp extends StatelessWidget {
  const materApp({
    super.key,
    required this.locae,
    required this.theme,
    required this.messageinternet,
  });

  final String? locae;
  final String? theme;
  final String? messageinternet;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(locae!),
      //~ دعم اللغات المتوفرة
      supportedLocales: const [
        Locale('en'), // الإنجليزية
        Locale('ar'), // العربية
      ],

      //~ القوائم المفوضة لترجمة النصوص وعناصر الواجهة
      localizationsDelegates: [
        AppLocalizations.delegate, //^ المفوض الخاص بالترجمات المخصصة لتطبيقك
        GlobalMaterialLocalizations
            .delegate, //^ المفوض لترجمات واجهات مكتبة الـMaterial
        GlobalWidgetsLocalizations.delegate, //^ المفوض لترجمات الواجهات العامة
        GlobalCupertinoLocalizations
            .delegate, //^ المفوض لترجمات واجهات مكتبة الـCupertino
      ],

      //~ دالة لتحديد اللغة المفضلة بناءً على إعدادات جهاز المستخدم
      localeListResolutionCallback: (deviceLocale, supportedLocales) {
        //~ التحقق من اللغات المدعومة ومطابقتها مع لغة الجهاز
        for (var locale in supportedLocales) {
          if (deviceLocale != null) {
            Locale device =
                deviceLocale.first; //* الحصول على أول لغة مفضلة في الجهاز
            if (device.languageCode == locale.languageCode) {
              return device; //* إعادة لغة الجهاز إذا كانت مدعومة
            }
          }
        }
        return supportedLocales
            .first; //* إذا لم تكن لغة الجهاز مدعومة، يتم استخدام اللغة الافتراضية
      },

      title: 'Flutter Demo',
      theme: theme == 'l' ? ThemeData.light() : ThemeData.dark(),
      home: MyHomePage(
        message: messageinternet!,
      ),
    );
  }
}
