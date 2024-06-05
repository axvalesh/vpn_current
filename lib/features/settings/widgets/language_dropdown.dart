import 'package:defer_pointer/defer_pointer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sebek_vpn/constants/colors.dart';

import '../cubit/settings_cubit.dart';
import '../enums/enums.dart';
import 'widgets.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({Key? key, this.margin}) : super(key: key);

  final EdgeInsets? margin;

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  bool _showLanguages = false;

  _toggleShowLanguages() {
    setState(() {
      _showLanguages = !_showLanguages;
    });
  }

  List<Widget> _languageRows(BuildContext context) {
    SettingsState state = context.read<SettingsCubit>().state;
    Language selectedLanguage = state.language;
    List<Language> languages = [...Language.values];
    languages.removeWhere((language) => language == selectedLanguage);
    return languages
        .map(
          (language) => LanguageRow(
            language: language,
            onTap: () {
              context.setLocale(Locale(language.name));
              context.read<SettingsCubit>().changeLanguage(language);
              setState(() {
                _showLanguages = false;
              });
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Padding(
          padding: widget.margin ?? EdgeInsets.zero,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const SizedBox(height: 62),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: DeferPointer(
                  paintOnTop: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: SebekColors.secondary,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: _toggleShowLanguages,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LanguageRow(language: state.language),
                              CupertinoButton(
                                onPressed: _toggleShowLanguages,
                                child: AnimatedRotation(
                                  turns: _showLanguages ? -.5 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: SvgPicture.asset(
                                    'assets/images/chevron_down.svg',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedCrossFade(
                          sizeCurve: Curves.easeInOut,
                          firstCurve: Curves.easeInOut,
                          secondCurve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 200),
                          crossFadeState: _showLanguages
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          firstChild: SizedBox(
                            width: MediaQuery.of(context).size.width,
                          ),
                          secondChild: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                    height: 1, color: SebekColors.primary),
                              ),
                              ..._languageRows(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
