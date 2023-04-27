import 'package:flutter_template/util/constants.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class OAuthStarva {
  static OAuthStarva? _instance;
  static OAuthStarva get instance => _instance ??= OAuthStarva._init();

  OAuthStarva._init();
  final String uri = "https://www.strava.com/oauth/mobile/authorize";

  Future<dynamic> authenticate() async {
    try {
      final String url = Uri(
        scheme: "https",
        host: "www.strava.com",
        path: "/oauth/mobile/authorize",
        queryParameters: {
          "client_id": STARVA_ID,
          "response_type": "code",
          "redirect_uri": "https://www.strava.com/mobile/authorization",
          "approval_prompt": "auto",
          "scope": "read,activity:read_all,profile:read_all,activity:write",
        },
      ).toString();

      final result = await FlutterWebAuth.authenticate(
        url: url,
        callbackUrlScheme: "web-staging.getsmartcue",
      );
      print(result);
      return result;
    } catch (error) {
      // Handle sign-in errors
      print(error);
    }
  }
}
//
