import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/custom_card.dart';
import 'package:let_tutor/presentation/app_setting/bloc/app_setting_bloc.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';

class SettingsTabView extends StatefulWidget {
  const SettingsTabView({Key? key}) : super(key: key);

  @override
  State<SettingsTabView> createState() => _SettingsTabViewState();
}

class _SettingsTabViewState extends State<SettingsTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (BuildContext context, AppSettingState state) {
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
                  child: Image.asset(
                    'assets/icons/logo.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Nguyen Van Hao',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Haonguyencp2@@gmail.com',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'Account ID: 12341234 1234 123412 34',
                style: context.textTheme.bodyMedium,
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
                      state.langIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    Text('(${state.langCode})'),
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
                  if (state.appearance.isLight) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }

                  context.read<AppSettingBloc>().add(SaveAppearanceEvent());
                },
                label: S.of(context).appearance,
                icon: Icon(
                  state.appearance.isDark ? Icons.dark_mode : Icons.light_mode,
                  size: 30,
                ),
                trailing: Text(
                  state.appearance.isLight
                      ? S.of(context).lightTheme
                      : S.of(context).darkTheme,
                ),
                showArrowIcon: false,
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).becomeATutor,
                icon: const Icon(Icons.assignment, size: 30),
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).privacyPolicy,
                icon: const Icon(Icons.privacy_tip_outlined, size: 30),
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).termAndConditions,
                icon: const Icon(Icons.newspaper_outlined, size: 30),
              ),
              const SizedBox(height: 4),
              CustomCardWidget(
                label: S.of(context).contact,
                icon: const Icon(Icons.contact_mail_outlined, size: 30),
              ),
              const SizedBox(height: 48),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (_, state) {
                  state.maybeWhen(
                    orElse: () {},
                    initial: () =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteList.login,
                      (route) => false,
                    ),
                  );
                },
                builder: (_, __) {
                  return TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.logOut());
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
                  );
                },
              ),
              const SizedBox(height: 48),
            ],
          );
        },
      ),
    );
  }
}

Future<bool> _showLogOutConfirmDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('NO')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('YES')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
