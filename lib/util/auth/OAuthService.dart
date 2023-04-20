import 'package:google_sign_in/google_sign_in.dart';

class OAuthService {
  static OAuthService? _instance;
  static OAuthService get instance => _instance ??= OAuthService._init();
  OAuthService._init();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "519403999623-5508ivut30erc7r9tpin0vg9sd22bham.apps.googleusercontent.com",
  );

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        GoogleSignInAccount? account = _googleSignIn.currentUser;
        final String? authCode = account!.serverAuthCode;
        print(authCode);
        // Handle successful sign-in and auth code retrieval
      }
    } catch (error) {
      // Handle sign-in errors
      print(error);
    }
  }

  signOutWithGoogle() async {
    await _googleSignIn.disconnect();
  }
}
// keytool -genkey -v -keystore mykey.jks -keyalg RSA -keysize 2048 -validity 10000 -alias debugKey
