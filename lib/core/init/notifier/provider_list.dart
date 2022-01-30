import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../view/home/viewmodel/home_view_model.dart';
import '../../constants/enums/local_keys_enum.dart';
import '../cache/local_manager.dart';
import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';
import 'theme_notifier.dart';

class ProviderList {
  static ProviderList? _instance;
  ProviderList._();
  static ProviderList get instance => _instance ??= ProviderList._();

  List<SingleChildWidget> items = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(
          LocalManager.instance.getBoolValue(StorageKeys.theme)
              ? AppThemeDark.instance.theme
              : AppThemeLight.instance.theme),
    ),
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel(),)
  ];
}
