import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/custom_card.dart';
import 'package:let_tutor/presentation/app_setting/bloc/app_setting_bloc.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsTabView extends StatefulWidget {
  const SettingsTabView({Key? key}) : super(key: key);

  @override
  State<SettingsTabView> createState() => _SettingsTabViewState();
}

class _SettingsTabViewState extends State<SettingsTabView> {
  @override
  Widget build(BuildContext context) {
    final appSettingstate = context.read<AppSettingBloc>().state;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (_, AuthState authState) {
          final user = authState.user;
          return Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: context.backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.transparent),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: user?.avatar != null
                      ? user?.avatar?.contains('http') ?? false
                          ? Image.network(
                              user!.avatar!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.person_rounded),
                            )
                          : Image.file(
                              File(user!.avatar!),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.person_rounded),
                            )
                      : Image.asset(
                          'assets/icons/logo.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person_rounded),
                        ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user?.name ?? "",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                user?.email ?? "",
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'Account ID: ${user?.id}',
                style: context.textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 14),
              CustomCardWidget(
                label: S.of(context).profile,
                icon: const Icon(Icons.person_2_outlined, size: 30),
                onTap: () => Navigator.of(context).pushNamed(RouteList.profile),
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).language,
                icon: const Icon(Icons.language, size: 30),
                trailing: Row(
                  children: [
                    Image.asset(
                      appSettingstate.langIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    Text('(${appSettingstate.langCode})'),
                  ],
                ),
                showArrowIcon: false,
                onTap: () {
                  context.read<AppSettingBloc>().add(SaveLanguageEvent());
                },
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                onTap: () {
                  if (appSettingstate.appearance.isLight) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }

                  context.read<AppSettingBloc>().add(SaveAppearanceEvent());
                },
                label: S.of(context).appearance,
                icon: Icon(
                  appSettingstate.appearance.isDark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  size: 30,
                ),
                trailing: Text(
                  appSettingstate.appearance.isLight
                      ? S.of(context).lightTheme
                      : S.of(context).darkTheme,
                ),
                showArrowIcon: false,
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).becomeATutor,
                icon: const Icon(Icons.assignment, size: 30),
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteList.becomeTutor),
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).privacyPolicy,
                icon: const Icon(Icons.privacy_tip_outlined, size: 30),
                onTap: () async {
                  final Uri url =
                      Uri.parse('https://lettutor.com/tos.html');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).termAndConditions,
                icon: const Icon(Icons.newspaper_outlined, size: 30),
                onTap: () async {
                  final Uri url = Uri.parse('https://lettutor.com/tos.html');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).contact,
                icon: const Icon(Icons.contact_mail_outlined, size: 30),
              ),
              const SizedBox(height: 48),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogOut());
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteList.login, (route) => false);
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(44),
                  backgroundColor: const Color.fromRGBO(255, 0, 0, 0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, color: Colors.red),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).logOut,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          );
        },
      ),
    );
  }
}
