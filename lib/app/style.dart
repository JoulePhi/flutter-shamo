import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flushbar/flushbar.dart';

const primaryColor = Color(0xff6C5ECF);
const secondaryColor = Color(0xff38ABBE);
const alertColor = Color(0xffED6363);
const priceColor = Color(0xff2C96F1);
const bg1 = Color(0xff1F1D2B);
const bg2 = Color(0xff2B2937);
const bg3 = Color(0xff242231);
const primaryTextColor = Color(0xffF1F0F2);
const secondaryTextColor = Color(0xff999999);
const subtitleTextColor = Color(0xff504F5E);
const black = Color(0xff2E2E2E);
const bottomNavColor = Color(0xff252836);
const unactivePage = Color(0xff808191);
const transparent = Colors.transparent;
const borderColor = Color(0xff302F37);
const green = Color(0xff51C17E);
const grey = Color(0xff3F4251);
const lightGrey = Color(0xff2F3344);

TextStyle whiteText = GoogleFonts.poppins(
  color: primaryTextColor,
);
TextStyle subtitleText = GoogleFonts.poppins(
  color: subtitleTextColor,
);
TextStyle purpleText = GoogleFonts.poppins(
  color: primaryColor,
);
TextStyle priceText = GoogleFonts.poppins(
  color: priceColor,
);
TextStyle productTitleText = GoogleFonts.poppins(
  color: black,
);
TextStyle productCategoryText = GoogleFonts.poppins(
  color: secondaryTextColor,
);
TextStyle alertText = GoogleFonts.poppins(
  color: alertColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

Widget spaceV(double height) {
  return SizedBox(
    height: height,
  );
}

Widget spaceH(double width) {
  return SizedBox(
    width: width,
  );
}

Widget appFormField({
  required String title,
  required String hint,
  required String icon,
  bool obscured = false,
  TextEditingController? controller,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: whiteText.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        spaceV(12),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: bg2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 17,
                ),
                spaceH(16),
                Expanded(
                  child: TextFormField(
                    style: whiteText,
                    controller: controller,
                    cursorColor: secondaryColor,
                    obscureText: obscured,
                    decoration: InputDecoration.collapsed(
                      hintText: hint,
                      hintStyle: subtitleText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget appFormButton({
  required String title,
  Function()? onPressed,
  bool isLoading = false,
}) {
  return Container(
    height: 50,
    width: double.infinity,
    margin: const EdgeInsets.only(top: 10),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 25,
              height: 25,
              child: Center(
                child: CircularProgressIndicator(
                  color: primaryTextColor,
                ),
              ),
            )
          : Center(
              child: Text(
                title,
                style: whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
    ),
  );
}

errorSnackbar({
  String message = '',
}) {
  Flushbar(
    messageText: Center(
      child: Text(
        message,
        style: whiteText.copyWith(fontSize: 12),
      ),
    ),
    backgroundColor: alertColor,
    duration: const Duration(seconds: 2),
    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
  ).show(Get.context!);
}

successSnackbar({
  String message = '',
}) {
  Flushbar(
    messageText: Center(
      child: Text(
        message,
        style: whiteText.copyWith(fontSize: 12),
      ),
    ),
    backgroundColor: secondaryColor,
    duration: const Duration(seconds: 2),
    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
  ).show(Get.context!);
}

loadingDialog({
  String message = '',
  var controller,
}) async {
  await Get.dialog(
    AlertDialog(
      backgroundColor: bg1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                  color: secondaryColor, strokeWidth: 5),
            ),
            Text(
              'Loading',
              style: whiteText.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            Text(
              message,
              style: productCategoryText,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

successDialog() async {
  await Get.dialog(
    AlertDialog(
      backgroundColor: bg1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/success_icon.png'),
            ),
            Text(
              'Hurray :)',
              style: whiteText.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            Text(
              'Item added succesfully',
              style: productCategoryText,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
              width: 250,
              child: TextButton(
                onPressed: () async {
                  Get.back();
                  Get.toNamed('/cart');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'View My Cart',
                  style: whiteText.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}
