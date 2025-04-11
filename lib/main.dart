import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/home.dart';
import 'Password.dart';

void main() {
  runApp(MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/password',
      builder:
          (context, state) => Password(
            number: state.extra as String?, // ارسال داده به کانستراکتور
          ),
    ),
    GoRoute(
      path: "/home",
      builder:
          (context, state) => HomePage(
            number: state.extra as String?, // ارسال داده به کانستراکتور
          ),
    ),
  ],
);

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
  String enteredText = "";
  String englandEnteredText = "";

  // تابع تبدیل کننده اعداد فارسی به انگلیسی
  String convertFarsiToEnglishNumbers(String input) {
    const Map<String, String> farsiToEnglish = {
      '۰': '0',
      '۱': '1',
      '۲': '2',
      '۳': '3',
      '۴': '4',
      '۵': '5',
      '۶': '6',
      '۷': '7',
      '۸': '8',
      '۹': '9',
    };

    String output = input;
    farsiToEnglish.forEach((farsiNum, englishNum) {
      output = output.replaceAll(farsiNum, englishNum);
    });

    return output;
  }

  @override
  Widget build(BuildContext context) {
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
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      255,
                                      133,
                                      133,
                                      133,
                                    ),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final enteredText = _textController.text;
                                  final englandEnteredText =
                                      convertFarsiToEnglishNumbers(enteredText);
                                  context.go(
                                    '/password',
                                    extra: englandEnteredText,
                                  );
                                }
                              },
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
