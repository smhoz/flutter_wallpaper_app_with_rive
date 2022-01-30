import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constant.dart';
import 'core/init/cache/local_manager.dart';
import 'core/init/lang/language_localization.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/home/view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalManager.instance.preferencesInit();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
      providers: ProviderList.instance.items,
      builder: (context, child) {
        return EasyLocalization(
          child: const MyApp(),
          supportedLocales: LanguageLocalization.instance.supportedLocales,
          path: ApplicationConstants.LANG_ASSETS_PATH,
        );
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      title: ApplicationConstants.APP_TITTLE,
      theme: Provider.of<ThemeNotifier>(context).getTheme(),
      home: const HomeView(),
    );
  }
}
