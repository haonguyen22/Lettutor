import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:let_tutor/constants/route_list.dart';
import 'package:let_tutor/presentation/auth/widgets/icon_language.dart';
import 'package:let_tutor/widget/custom_input_field.dart';
import 'package:localization/localization.dart';

class AuthScreen extends StatefulWidget {
  final bool isLoginScreen;

  const AuthScreen.login({super.key}) : isLoginScreen = true;
  const AuthScreen.signUp({super.key}) : isLoginScreen = false;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  String message = '';

  Color get primaryColor => Theme.of(context).primaryColor;

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
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
        leadingWidth: 150,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: const [IconLanguageWidget()],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    isLoginScreen ? S.of(context).logIn : S.of(context).signUp,
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
                  const SizedBox(height: 16),
                  CustomInputLabelField(
                    label: S.of(context).email,
                    controller: email,
                    hintText: 'abc@example.com',
                  ),
                  const SizedBox(height: 8),
                  CustomInputLabelField(
                    label: S.of(context).password,
                    controller: password,
                    isObscure: true,
                  ),
                  if (message.isNotEmpty)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                top: 10, bottom: 6),
                            decoration: BoxDecoration(
                              color: Color(int.parse('ffffccc7', radix: 16)),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 12, vertical: 12),
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
                    ),
                  const SizedBox(height: 16.0),
                  if (isLoginScreen)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            S.of(context).forgotPassword,
                            textAlign: TextAlign.start,
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
                                  const EdgeInsets.symmetric(vertical: 12)),
                          onPressed: () {},
                          child: Text(
                            (isLoginScreen
                                    ? S.of(context).logIn
                                    : S.of(context).signUp)
                                .toUpperCase(),
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
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
                    children: ['facebook', 'gmail']
                        .expand(
                          (element) => [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SvgPicture.asset(
                                'assets/icons/$element.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  if (isLoginScreen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).notAMember),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const AuthScreen.signUp()),
                            // );
                            Navigator.pushReplacementNamed(
                                context, RouteList.signUp);
                          },
                          child: Text(
                            S.of(context).signUp,
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!isLoginScreen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).alreadyHaveAnAccount),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const AuthScreen.login()),
                            // );
                            Navigator.pushReplacementNamed(
                                context, RouteList.login);
                          },
                          child: Text(
                            S.of(context).logIn,
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
          )
        ],
      ),
    );
  }
}
