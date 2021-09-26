import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/app/app_locale.dart';
import '../../setting/theme.dart';
import '/view/util/logo.dart';
import '/view/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _login = TextEditingController();
  final _password = TextEditingController();
  bool _rememberMe = true;
  bool _iAgree = false;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocale.of(context);
    return Scaffold(
      backgroundColor: AppTheme.loginBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(locale.get('LOGIN'))),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: _login,
                          autofocus: true,
                          decoration: InputDecoration(hintText: locale.get(' phone or email')),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(locale.get('PASSWORD'))),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: _password,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Checkbox(
                      value: _rememberMe,
                      onChanged: (v) => setState(() => _rememberMe = v ?? false),
                    )),
                    Expanded(
                      flex: 2,
                      child: Text(locale.get('Remember me')),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Checkbox(
                        value: _iAgree,
                        onChanged: (v) => setState(() => _iAgree = v ?? false),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(locale.get('I have read and agree with:')),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            child: TextButton(
                              child: Text(locale.get('- Public offer')),
                              onPressed: () => launch('https://www.federalreserve.gov'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: TextButton(
                              child: Text(locale.get('- System rules')),
                              onPressed: () => launch('https://www.cbr.ru'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
              child: Text(locale.get('Remember password')),
              onPressed: null,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: ElevatedButton(
                child: Text(locale.get('LOG IN')),
                onPressed: _done,
              ),
            ),
            BottomLogo(),
          ],
        ),
      ),
    );
  }

  void _done() {
    if (false && (_login.text.isEmpty || _password.text.isEmpty || !_iAgree)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocale.of(context).get('Enter Login and Password, agree Offer and Rules!'))));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }
  }
}
