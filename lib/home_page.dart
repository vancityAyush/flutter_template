import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/gen/colors.gen.dart';
import 'package:flutter_template/util/auth/starva_oauth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
      ),
      body: Container(
        width: 350.w,
        height: 0.5.sh,
        decoration: const BoxDecoration(
          color: AppColors.gray410,
          // image: DecorationImage(
          //   image: Assets.images.tif.provider(),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: ElevatedButton(
            onPressed: () async {
              // await OAuthService.instance.signInWithGoogle().then((value) =>
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       content: Text(value.toString()),
              //     )));
              await OAuthStarva.instance.authenticate();
            },
            child: Text(
              'login'.tr(),
            )),
      ),
    );
  }
}
