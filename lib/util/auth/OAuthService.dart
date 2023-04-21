import 'package:google_sign_in/google_sign_in.dart';

class OAuthService {
  static OAuthService? _instance;

  static OAuthService get instance => _instance ??= OAuthService._init();

  OAuthService._init();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      "https://www.googleapis.com/auth/userinfo.profile",
      "https://www.googleapis.com/auth/userinfo.email",
      "openid",
    ],
    serverClientId:
        "923737583384-nb432n2nbpvb76fs4vhicq8uejf00utq.apps.googleusercontent.com",
  );

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        GoogleSignInAccount? account = _googleSignIn.currentUser;
        final String? authCode = account!.serverAuthCode;

        print(authCode);
        return authCode;
        // Handle successful sign-in and auth code retrieval
      }
    } catch (error) {
      // Handle sign-in errors
      print(error);
      return error;
    }
  }

  signOutWithGoogle() async {
    await _googleSignIn.disconnect();
  }
}
// keytool -genkey -v -keystore mykey.jks -keyalg RSA -keysize 2048 -validity 10000 -alias debugKey
