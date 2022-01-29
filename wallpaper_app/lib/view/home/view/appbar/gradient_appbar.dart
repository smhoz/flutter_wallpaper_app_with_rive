import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/border/custom_border.dart';
import '../../../../core/components/button/gradient_container.dart';
import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/constants/app/assets_constant.dart';
import '../../../../core/constants/app/widgets_constant.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/constants/enums/local_keys_enum.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/init/cache/local_manager.dart';
import '../../../../core/init/lang/language_localization.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/init/theme/colors/gradient_colors.dart';
import '../../viewmodel/home_view_model.dart';

class GradientAppBar extends StatelessWidget {
  final bool isScroll;
  const GradientAppBar({Key? key, required this.isScroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: WidgetsConstant.instance.normalDuration,
      padding: context.statusbarHeightPadding,
      height: isScroll ? WidgetsConstant.instance.zero : context.height * 0.1,
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _languageIconButton(context),
            Text(
              ApplicationConstants.APP_TITTLE,
              style: context.textTheme.bodyText1,
            ),
            _changeThemeButton(context)
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _changeThemeButton(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _changeTheme(),
          Text(
            "darkmode".locale,
            style: context.textTheme.headline3,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _languageIconButton(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          _showDialog(context);
        },
        child: _languageIcon(context),
      ),
    );
  }

  Widget _languageIcon(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: context.iconPadding,
          child: GradientContainer(
              gradientColors: context.isDark
                  ? GradientColors.sunset
                  : GradientColors.lightGradientColors,
              child: Icon(
                Icons.language,
                size: WidgetsConstant.instance.iconSize,
              )),
        ),
        Text("language".locale, style: context.textTheme.headline3),
      ],
    );
  }

  Future<String?> _showDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: WidgetsConstant.instance.zero,
        title: Text("language".locale),
        shape: RoundedRectangleBorder(
            borderRadius: CustomBorderRadius.allCircular()),
        content: SizedBox(
          height: context.height * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _flagIcon(context, LanguageLocalization.instance.trLocale,
                  AssetsConstant.trFlag, "turkish"),
              _flagIcon(context, LanguageLocalization.instance.enLocale,
                  AssetsConstant.enFlag, "english"),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _flagIcon(
      BuildContext context, Locale locale, String assetPath, String label) {
    return GestureDetector(
      onTap: () {
        context.setLocale(locale);
        NavigationService.instance.navigatePop(context);
      },
      child: Column(
        children: [
          ClipRRect(
              borderRadius: CustomBorderRadius.allCircular(),
              child: SvgPicture.asset(
                assetPath,
                width: 50,
                height: 50,
              )),
          Text(label.locale)
        ],
      ),
    );
  }

  Widget _changeTheme() {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Transform.scale(
        scale: isScroll ? WidgetsConstant.instance.zero : 0.70,
        child: CupertinoSwitch(
          thumbColor: context.isDark
              ? context.theme.shadowColor
              : context.theme.scaffoldBackgroundColor,
          value: LocalManager.instance.getBoolValue(StorageKeys.theme),
          onChanged: (value) {
            value
                ? model.changeTheme(AppThemes.dark)
                : model.changeTheme(AppThemes.light);

            LocalManager.instance.setBoolValue(StorageKeys.theme, value);
          },
          activeColor: context.theme.toggleableActiveColor,
        ),
      );
    });
  }
}
