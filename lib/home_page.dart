import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/gen/colors.gen.dart';
import 'package:flutter_template/gen/fonts.gen.dart';

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
        decoration: BoxDecoration(
          color: AppColors.gray410,
          // image: DecorationImage(
          //   image: Assets.images.tif.provider(),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: Text('Hello World',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: Fonts.montserrat,
            )),
      ),
    );
  }
}
