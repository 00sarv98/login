import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';
import 'frequently_used_functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ورود به سیستم',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "shabnam"),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
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
    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 133, 133, 133),
        width: 1,
      ),
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
                    Text(
                      "شماره همراه",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "3.32.0(100662)",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "لطفا کشور و شمارهٔ همراه خود را وارد کنید.",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 20.0),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text("ایران"),
                                      Expanded(child: Container()),
                                      Text("+98"),
                                      SizedBox(width: 15),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 23.0),
                          SizedBox(
                            child: TextFormField(
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
                                  return "لطفا شماره تلفن را وارد کنید";
                                }
                                final englandEnteredText =
                                    convertFarsiToEnglishNumbers(value);
                                if (!englandEnteredText.startsWith("09") &&
                                    !englandEnteredText.startsWith("989") &&
                                    !englandEnteredText.startsWith("+989")) {
                                  return "لطفا شماره تلفن با فرمت صحیح وارد کنید";
                                }
                                if (englandEnteredText.length < 11) {
                                  return "شماره تلفن باید حداقل ۱۱ رقم باشد";
                                }
                                return null;
                              },
                            ),
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
                                        }
                                      }
                                      : null,
                              child: Text("تایید و ادامه"),
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
