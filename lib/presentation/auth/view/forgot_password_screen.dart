import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/auth/widgets/icon_language.dart';
import 'package:let_tutor/core/widget/custom_input_field.dart';
import 'package:let_tutor/core/widget/logo_icon.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/localization.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController email =
      TextEditingController(text: "student@lettutor.com");

  String message = '';

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteList.login,
                (route) => false,
              );
            },
            child: const LogoAppWidget()),
        leadingWidth: 150,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: const [IconLanguageWidget()],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        Text(
                          S.of(context).resetPassword,
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          S.of(context).resetPasswordDescription,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CustomInputLabelField(
                            label: S.of(context).email,
                            controller: email,
                            hintText: 'abc@example.com',
                            onValidator: (input) {
                              if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(input ?? '')) {
                                return S.of(context).notValidEmail;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: context.primaryColor,
                                ),
                                onPressed: () {
                                  if (email.text.isNotEmpty) {
                                    context
                                        .read<AuthBloc>()
                                        .add(ForgotPassword(email.text));
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    state.isLoading
                                        ? Container(
                                            margin: const EdgeInsetsDirectional
                                                .only(start: 10),
                                            width: 20,
                                            height: 20,
                                            child:
                                                const CircularProgressIndicator(),
                                          )
                                        : const SizedBox(),
                                    const SizedBox(width: 10),
                                    Text(
                                      S.of(context).sendResetLink,
                                      style:
                                          context.textTheme.bodyLarge?.copyWith(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
        buildWhen: (previous, current) => current != previous,
        listener: (_, AuthState state) {
          if (state is ForgotPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '✅ ${state.message ?? S.of(context).resetPasswordSuccess}'),
              ),
            );
          } else if (state is ForgotPasswordFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('⛔ ${S.of(context).resetPasswordError}'),
              ),
            );
          }
        },
      ),
    );
  }
}
