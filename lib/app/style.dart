import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Text(
        title,
        style: whiteText.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
      ),
    ),
  );
}
