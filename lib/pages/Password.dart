import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Password extends StatefulWidget {
  final String? number;

  const Password({super.key, this.number});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKeyTwo = GlobalKey<FormState>();
  final _textControllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 50),
            child: Center(
              child: SizedBox(
                width: 336.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "رمز عبور",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "کد ارسال شده به شماره همراه ${widget.number} را وارد کنید",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKeyTwo,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: TextFormField(
                              controller: _textControllerTwo,
                              decoration: InputDecoration(
                                labelText: "کد ورود",
                                hintText: "مثال: 665 859",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.length != 6) {
                                  return "طول کد ۶ رقم می باشد";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52.0,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKeyTwo.currentState!.validate()) {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    context.go('/home', extra: widget.number);
                                  });
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
