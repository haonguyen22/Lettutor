import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/presentation/auth/widgets/icon_language.dart';
import 'package:let_tutor/core/widget/custom_input_field.dart';
import 'package:let_tutor/core/widget/logo_icon.dart';
import 'package:localization/localization.dart';

class AuthScreen extends StatefulWidget {
  final bool isLoginScreen;

  const AuthScreen.login({super.key}) : isLoginScreen = true;
  const AuthScreen.signUp({super.key}) : isLoginScreen = false;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController email;
  late final TextEditingController password;
  final _formKey = GlobalKey<FormState>();

  String message = '';

  Color get primaryColor => context.primaryColor;
  @override
  void initState() {
    email = TextEditingController(
        text: widget.isLoginScreen ? "student@lettutor.com" : "");
    password =
        TextEditingController(text: widget.isLoginScreen ? "123456" : "");
    context.read<AuthBloc>().add(FetchUser());

    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoginScreen = widget.isLoginScreen;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const LogoAppWidget(),
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
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Image.asset(
                            'assets/images/login.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          isLoginScreen
                              ? S.of(context).logIn
                              : S.of(context).signUp,
                          style: textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).loginDescription,
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium?.copyWith(
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
                        CustomInputLabelField(
                          label: S.of(context).password,
                          controller: password,
                          isObscure: true,
                          onValidator: (String? input) {
                            if ((input?.length ?? 0) < 6) {
                              return S.of(context).min8Characters;
                            }
                            return null;
                          },
                        ),
                        message.isNotEmpty
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsetsDirectional.only(
                                          top: 10, bottom: 6),
                                      decoration: BoxDecoration(
                                        color: Color(
                                            int.parse('ffffccc7', radix: 16)),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      width: double.infinity,
                                      padding:
                                          const EdgeInsetsDirectional.all(12),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.remove_circle_sharp,
                                              color: Colors.red),
                                          const SizedBox(width: 10),
                                          Text(message),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(height: 16),
                        if (isLoginScreen)
                          Row(
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(RouteList.forgotPassword),
                                child: Text(
                                  S.of(context).forgotPassword,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: context.primaryColor),
                                ),
                              ),
                            ],
                          ),
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
                                  if (_formKey.currentState!.validate()) {
                                    isLoginScreen
                                        ? context.read<AuthBloc>().add(Login(
                                              email.text,
                                              password.text,
                                            ))
                                        : context.read<AuthBloc>().add(Register(
                                              email.text,
                                              password.text,
                                            ));
                                    return;
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              S.of(context).checkValidate)));
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
                                      (isLoginScreen
                                              ? S.of(context).logIn
                                              : S.of(context).signUp)
                                          .toUpperCase(),
                                      style: textTheme.bodyLarge?.copyWith(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            S.of(context).orContinueWith,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  context.read<AuthBloc>().add(GoogleLogin()),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: SvgPicture.asset(
                                  'assets/icons/gmail.svg',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  context.read<AuthBloc>().add(FacebookLogin()),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: SvgPicture.asset(
                                  'assets/icons/facebook.svg',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).notAMember),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  isLoginScreen
                                      ? RouteList.signUp
                                      : RouteList.login,
                                );
                              },
                              child: Text(
                                isLoginScreen
                                    ? S.of(context).signUp
                                    : S.of(context).logIn,
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthSuccess) {
            if (context.read<AuthBloc>().state.user != null) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(RouteList.home, (route) => false);
            }
          }
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message ?? '')));
          }

          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message ?? '')));
          }
        },
      ),
    );
  }
}
