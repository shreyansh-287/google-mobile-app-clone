import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/web/web_search.dart';
import 'package:google_clone/widgets/translation_buttons.dart';
import 'package:google_clone/widgets/web/search_buttons.dart';
import 'package:google_clone/widgets/web/web_footer.dart';
import 'package:url_launcher/url_launcher.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () => _launchURL(
                  "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox"),
              child: const Text(
                'Gmail',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () => _launchURL(
                  "https://www.google.com/imghp?hl=en&tab=ri&authuser=0&ogbl"),
              child: const Text(
                'Images',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/more-apps.svg',
                color: primaryColor,
              ),
              onPressed: () =>
                  _launchURL("https://about.google/products/?tab=rh"),
            ),
            const SizedBox(width: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
              child: MaterialButton(
                onPressed: () => _launchURL(
                    "https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fwww.google.com%3Fhl%3Den-US&ec=GAlA8wE&hl=en&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S1526875506%3A1705166128212707&theme=glif"),
                color: const Color(0xff1A73EB),
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.25),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // since children of column are not supposed to be 'spaced between'
                    Column(
                      children: [
                        Search(),
                        SizedBox(height: 20),
                        SearchButtons(),
                        SizedBox(height: 20),
                        TranslationButtons(),
                      ],
                    ),
                    WebFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
