import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garrar/core/utils/colors.dart';

class Dialogues {
  infoDialog(
      {required BuildContext context,
      required String title,
      required String desc,
      required DialogType dialogType,
      Function? callbackFunction}) {
    AwesomeDialog(
        padding: const EdgeInsets.all(10),
        desc: desc,
        descTextStyle: const TextStyle(fontSize: 14),
        titleTextStyle: const TextStyle(fontSize: 17),
        title: title,
        context: context,
        animType: AnimType.scale,
        dialogType: dialogType,
        onDismissCallback: (dismissType) {
          if (callbackFunction != null) callbackFunction();
        }).show();
  }

  dynamic customDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required Function onPress,
    required String buttonName,
    required double opacity,
    required Widget content,
    required bool close,
  }) =>
      EasyDialog(
          cardColor: Colors.white,
          fogOpacity: opacity,
          cornerRadius: 30,
          // contentPadding: EdgeInsets.all(20),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: ColorsManager.primary,
            ),
          ),
          description: Text(
            desc,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          closeButton: close,
          contentList: [
            Align(
              alignment: Alignment.bottomCenter,
              // heightFactor: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  backgroundColor: ColorsManager.primary,
                ),
                child: Text(
                  buttonName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  onPress();
                },
              ),
            ),
          ]).show(context);

  confirmDialog(
      {required BuildContext context,
      required String title,
      required String desc,
      required Function onPress,
      required String buttonName,
      required double opacity}) {
    return EasyDialog(
        cardColor: Colors.white,
        fogOpacity: opacity,
        cornerRadius: 30,
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: ColorsManager.primary,
          ),
        ),
        description: Text(
          desc,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        closeButton: true,
        contentList: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              backgroundColor: ColorsManager.primary,
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
            ),
            onPressed: () {
              onPress();
            },
            child: Text(
              buttonName,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ]).show(context);
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
      padding: const EdgeInsets.all(10),
      dismissOnBackKeyPress: dismiss ?? true,
      dismissOnTouchOutside: dismiss ?? true,
      animType: AnimType.scale,
      dialogType: dialogType,
      desc: desc,
      descTextStyle: const TextStyle(fontSize: 14),
      titleTextStyle: const TextStyle(fontSize: 17),
      title: title,
      btnOk: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          onTap();
        },
      ),
    ).show();
  }

  loading(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      autoHide: const Duration(seconds: 1),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    ).show();
  }

  Future<bool> onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("هل تريد اغلاق التطبيق ؟"),
        titleTextStyle: const TextStyle(fontSize: 17, color: Colors.black),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "لا",
              style: TextStyle(fontSize: 17),
            ),
          ),
          TextButton(
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: const Text(
              'نعم',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

  imagePreviewDialog(
      {required BuildContext context,
      required String title,
      required String desc,
      required Function onPress,
      required String buttonName,
      required double opacity,
      required Widget image}) {
    return EasyDialog(
        cardColor: Colors.white,
        fogOpacity: opacity,
        cornerRadius: 30,
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: ColorsManager.primary,
          ),
        ),
        description: Text(
          desc,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        closeButton: true,
        contentList: [
          Center(child: image),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
              backgroundColor: ColorsManager.primary,
            ),
            onPressed: () {
              onPress();
            },
            child: Text(
              buttonName,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ]).show(context);
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
        barrierColor: Colors.black.withOpacity(0.2),
        context: context,
        builder: (context) => const CupertinoActivityIndicator(radius: 18));
  }

  hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
