import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/widgets/custom_button.dart';

class Dialogues {
  infoDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required DialogType dialogType,
  }) {
    AwesomeDialog(
      padding: EdgeInsets.all(10.h),
      desc: desc,
      descTextStyle: TextStyle(fontSize: 14.sp),
      titleTextStyle: TextStyle(fontSize: 17.sp),
      title: title,
      context: context,
      animType: AnimType.scale,
      dialogType: dialogType,
    ).show();
  }

  alertDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required DialogType dialogType,
    required String buttonName,
    required Function onTap,
    bool? dismiss,
  }) {
    AwesomeDialog(
      context: context,
      padding: EdgeInsets.all(10.h),
      dismissOnBackKeyPress: dismiss ?? true,
      dismissOnTouchOutside: dismiss ?? true,
      animType: AnimType.scale,
      dialogType: dialogType,
      desc: desc,
      descTextStyle: TextStyle(fontSize: 14.sp),
      titleTextStyle: TextStyle(fontSize: 17.sp),
      title: title,
      btnOk: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 14.w),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          onTap();
        },
      ),
    ).show();
  }

  Future<bool> onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(("Do you want to close application".tr()),
            textAlign: TextAlign.center),
        titleTextStyle: TextStyle(fontSize: 17.sp, color: Colors.black),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              ("No".tr()),
              style: TextStyle(fontSize: 17.sp),
            ),
          ),
          TextButton(
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: Text(
              ('Yes'.tr()),
              style: TextStyle(fontSize: 17.sp),
            ),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
        barrierColor: Colors.black.withOpacity(0.2),
        context: context,
        builder: (context) => CupertinoActivityIndicator(radius: 18.r));
  }

  hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  cameraDialog({
    required BuildContext context,
    required Function onCameraTap,
    required Function onGalleryTap,
    bool? dismiss,
  }) {
    AwesomeDialog(
      context: context,
      padding: EdgeInsets.all(10.w),
      dismissOnBackKeyPress: dismiss ?? true,
      dismissOnTouchOutside: dismiss ?? true,
      animType: AnimType.scale,
      dialogType: DialogType.info,
      desc: 'Select image source'.tr(),
      descTextStyle: TextStyle(fontSize: 14.sp),
      titleTextStyle: TextStyle(fontSize: 17.sp),
      title: "Pick Image".tr(),
      btnCancel: CustomButton(
        onTap: () {
          Navigator.of(context).pop();
          onCameraTap();
        },
        buttonText: ('Camera'.tr()),
      ),
      btnOk: CustomButton(
        onTap: () {
          Navigator.of(context).pop();
          onGalleryTap();
        },
        buttonText: ('Gallery'.tr()),
      ),
    ).show();
  }
}

void showFillDataDialog({required BuildContext context}) {
  AwesomeDialog(
    context: context,
    title: ('Warning'.tr()),
    desc: ('Please fill all data'.tr()),
    showCloseIcon: true,
    dialogType: DialogType.warning,
    padding: EdgeInsets.all(10.w),

    animType: AnimType.scale,
    btnOk: CustomButton(
        onTap: () {
          Navigator.of(context).pop();
        },
        buttonText: 'Ok'.tr()),
    descTextStyle: TextStyle(fontSize: 14.sp),
    titleTextStyle: TextStyle(fontSize: 17.sp),
  ).show();
}
