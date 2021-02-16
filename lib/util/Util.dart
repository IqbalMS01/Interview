import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double paddingTop;
  static double paddingBottom;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static bool isTablet;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    paddingTop = _mediaQueryData.padding.top;
    paddingBottom = _mediaQueryData.padding.bottom;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    isTablet = _mediaQueryData.size.shortestSide < 600 ? false : true;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFAFAFC);
  static const Color primaryColor = Color(0xFFDF8100);
  static const Color secondaryColor = Color(0xFFFF9607);
  static const Color darkText = Color(0xFF535353);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color grey = Color(0xFFEEEEEE);
  static const Color blue = Color(0xFF737DFF);
  static const Color red = Color(0xFFFF7070);
  static const Color nearlyBlue = Color(0xFF17ead9);
  static const Color pink = Color(0xFFF56E98);
  static const Color green = Color(0xFF0BD132);
  static const Color yellow = Color(0xFFF7FF00);
  static const Color defaultShadow = Color(0xFF757575);
}

class AppString {
  static const String fontName = 'Gotham';
  static const String fontNameNumber = 'Nunito';
}

List<T> mapping<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final widthSBDefault = SizedBox(
  width: SizeConfig.blockSizeHorizontal * 4,
);

final notif = Image(
  image: AssetImage(
    'assets/images/notification.png',
  ),
  height: SizeConfig.blockSizeHorizontal * 9.0,
);

final topup = Image.asset(
  'assets/images/topup.png',
  height: SizeConfig.blockSizeHorizontal * 9,
);

final paket = Image.asset(
  'assets/images/paket.png',
  height: SizeConfig.blockSizeHorizontal * 9,
);

final voucher = Image.asset(
  'assets/images/vocer.png',
  height: SizeConfig.blockSizeHorizontal * 9,
);

final autoLending = Image.asset(
  'assets/images/ic_auto_landing.png',
  height: SizeConfig.blockSizeHorizontal * 9,
);

final buttonMp = Image(
  image: AssetImage('assets/images/button_mp.png'),
  height: SizeConfig.blockSizeHorizontal * 15.5,
);

final ratingImg = Image.asset(
  'assets/images/credit.png',
  width: SizeConfig.blockSizeHorizontal * 17.0,
);

final logo = Image.asset(
  'assets/images/logo_white.png',
  height: SizeConfig.blockSizeHorizontal * 11,
);

final githubLink = Image(
  image: AssetImage('assets/images/ic_withdrawal.png'),
  height: SizeConfig.blockSizeHorizontal * 11.6,
  color: AppColors.secondaryColor,
);

final linkedinLink = Image(
  image: AssetImage('assets/images/ic_referral_code.png'),
  height: SizeConfig.blockSizeHorizontal * 11.6,
  color: AppColors.secondaryColor,
);

final iconMedals = Image(
  image: AssetImage('assets/images/ic_medals.png'),
  height: SizeConfig.blockSizeHorizontal * 9,
);

final profileDefault = Image(
  image: AssetImage(
    'assets/images/profil_default.png',
  ),
  height: SizeConfig.blockSizeHorizontal * 10,
  width: SizeConfig.blockSizeHorizontal * 10,
  fit: BoxFit.cover,
);

final helpCSImg = Image(
  image: AssetImage('assets/images/ic_help_cs.png'),
  height: SizeConfig.blockSizeHorizontal * 11.6,
  color: AppColors.secondaryColor,
);

final settingImg = Image(
  image: AssetImage('assets/images/ic_settings.png'),
  height: SizeConfig.blockSizeHorizontal * 11.6,
  color: AppColors.secondaryColor,
);

final brView = BorderRadius.only(
  topLeft: Radius.circular(
    SizeConfig.blockSizeHorizontal * 6,
  ),
  topRight: Radius.circular(
    SizeConfig.blockSizeHorizontal * 6,
  ),
);

final months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

final brAll = BorderRadius.all(
  Radius.circular(
    SizeConfig.blockSizeHorizontal * 6,
  ),
);

const buttonBR = BorderRadius.all(
  Radius.circular(
    6,
  ),
);

final arrowDotRight = ImageIcon(
  AssetImage('assets/images/ic_arrow_right.png'),
  size: SizeConfig.blockSizeHorizontal * 8,
  color: AppColors.darkText,
);

final arrowDotRightWhite = ImageIcon(
  AssetImage('assets/images/ic_arrow_right.png'),
  size: SizeConfig.blockSizeHorizontal * 8,
  color: Colors.white,
);

final iconShare = ImageIcon(
  AssetImage('assets/images/ic_referral_share.png'),
  size: SizeConfig.blockSizeHorizontal * 8,
  color: AppColors.green,
);

final circleImg = Image.asset(
  'assets/images/header_circle.png',
  height: SizeConfig.blockSizeHorizontal * 32,
);

final iconMap = Image.asset(
  'assets/images/ic_map.png',
  height: SizeConfig.blockSizeHorizontal * 6,
);

final defaultBr = BorderRadius.only(
  topLeft: Radius.circular(
    SizeConfig.blockSizeHorizontal * 6,
  ),
  topRight: Radius.circular(
    SizeConfig.blockSizeHorizontal * 6,
  ),
);
