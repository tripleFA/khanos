import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:khanos/src/utils/theme_utils.dart';
import 'package:khanos/src/utils/widgets_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: normalAppBar('About Khanos') as PreferredSizeWidget?,
      body: _showAboutInfo(context),
    );
  }
}

_showAboutInfo(BuildContext context) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Hero(
              tag: 'Clipboard',
              child: Image.asset('assets/images/khanos_transparent.png'),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Text(
                  'Khanos App',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.TextSubHeader),
                ),
		RichText(
                  text: TextSpan(
                    text: 'Fork of the original project available ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.TextSubHeader,
                    ),
                    children: [
                      TextSpan(
                        text: 'here',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://github.com/Jeoxs/khanos'); 
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Version: 1.2.2',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.TextBody,
                      fontFamily: 'opensans'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    ),
  );
}
