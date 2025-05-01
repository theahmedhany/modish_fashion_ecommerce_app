import 'package:url_launcher/url_launcher.dart';

import '../widgets/show_snack_bar.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showSnackBar(context, 'Could not launch this URL ($url).');
    }
  }
}

/*

  onPressed: () async {
    launchCustomUrl(context, 'My Link');
  },

*/
