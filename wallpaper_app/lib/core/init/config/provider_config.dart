import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../view/home/viewmodel/home_view_model.dart';

class ProviderConfig {
  static ProviderConfig? _instance;
  ProviderConfig._();
  static ProviderConfig get instance => _instance ??= ProviderConfig._();

  ChangeNotifierProvider<HomeViewModel> getHomeViewModel(Widget child) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: child,
    );
  }
}
