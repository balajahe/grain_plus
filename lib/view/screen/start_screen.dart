import 'package:flutter/material.dart';

import '/app/app_locale.dart';
import '/setting/theme.dart';
import '/view/util/logo.dart';
import '/view/screen/login_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  build(context) {
    final locale = AppLocale.of(context);
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.loginBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 1),
            SizedBox(
              height: screen.height / 4,
              width: screen.height / 4,
              child: Container(color: Colors.red),
            ),
            Center(
              child: SizedBox(
                width: screen.width / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text(locale.get('LOG IN')),
                      style: AppTheme.commandButtonStyle,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      child: Text(locale.get('SIGN UP')),
                      style: AppTheme.commandButtonStyle,
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ),
            BottomLogo(),
          ],
        ),
      ),
    );
  }
}
