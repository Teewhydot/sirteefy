import 'package:url_launcher/url_launcher.dart';


Future<void> launchWebsiteUrl(String webUrl) async {
  final Uri url = Uri.parse(webUrl);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
