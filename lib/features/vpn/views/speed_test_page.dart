import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/features/vpn/views/connect_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SpeedTestPage extends StatelessWidget {
  static const String route = '/speed_test';

  SpeedTestPage({super.key});

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(Uri.parse('https://test.mm.pl/test_/index.html'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, ConnectPage.route),
          child: SvgPicture.asset('assets/images/back_arrow.svg'),
        ),
        title: Text(
          "SpeedTest",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ).tr(),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
