import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/circle_button.dart';
import '../../app_setting/bloc/app_setting_bloc.dart';

class IconLanguageWidget extends StatelessWidget {
  const IconLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      buildWhen: (previous, current) {
        return current.langCode != previous.langCode;
      },
      builder: (BuildContext context, AppSettingState state) {
        return GestureDetector(
          onTap: () {
            context.read<AppSettingBloc>().add(SaveLanguageEvent());
          },
          child: CircleButton(
            radius: 16,
            color: Theme.of(context).scaffoldBackgroundColor,
            imageWidget: Image.asset(
              state.langIcon,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
