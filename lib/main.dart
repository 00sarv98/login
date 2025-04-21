import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/bloc/theme/theme_bloc.dart';
import 'package:login/bloc/name_user/name_user_bloc.dart';
import 'package:login/theme.dart';
import 'router.dart';
import 'frequently_used_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<NameUserBloc>(create: (context) => NameUserBloc()),
      ],
      child: const AppWithTheme(),
    );
  }
}

class AppWithTheme extends StatelessWidget {
  const AppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme =
            state is ThemeDark ? MyThemeData.darkTheme : MyThemeData.lightTheme;

        return MaterialApp.router(
          title: 'ورود به سیستم',
          theme: theme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _textController.removeListener(_validateForm);
    _textController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid != _isFormValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 133, 133, 133)),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SizedBox(
                width: 336.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "شماره همراه",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "3.32.0(100662)",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "لطفا کشور و شمارهٔ همراه خود را وارد کنید.",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 20.0),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 52.0,
                            child: InkWell(
                              onTap: () {
                                // Handle country selection
                              },
                              child: Container(
                                decoration: boxDecoration,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text("ایران"),
                                      Spacer(),
                                      Text("+98"),
                                      SizedBox(width: 15),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 23.0),
                          TextFormField(
                            controller: _textController,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) => _validateForm(),
                            decoration: InputDecoration(
                              labelText: "شماره همراه",
                              hintText: "مثال: ۸۸۶۵ ۶۶۵ ۰۹۱۳",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "لطفا شماره همراه خود را وارد کنید";
                              }
                              final englandEnteredText =
                                  convertFarsiToEnglishNumbers(value);
                              if (!englandEnteredText.startsWith("09") &&
                                  !englandEnteredText.startsWith("989") &&
                                  !englandEnteredText.startsWith("+989")) {
                                return "لطفا شماره همراه را با فرمت صحیح وارد کنید";
                              }
                              if (englandEnteredText.length < 11) {
                                return "شماره تلفن باید حداقل ۱۱ رقم باشد";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52.0,
                            child: ElevatedButton(
                              onPressed:
                                  _isFormValid
                                      ? () {
                                        if (_formKey.currentState!.validate()) {
                                          final enteredText =
                                              _textController.text;
                                          final englandEnteredText =
                                              convertFarsiToEnglishNumbers(
                                                enteredText,
                                              );
                                          context.go(
                                            '/password',
                                            extra: englandEnteredText,
                                          );
                                          context.read<NameUserBloc>().add(
                                            TextChanged(englandEnteredText),
                                          );
                                        }
                                      }
                                      : null,
                              child: const Text("تایید و ادامه"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
