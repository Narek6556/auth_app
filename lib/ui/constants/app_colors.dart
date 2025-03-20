import 'dart:ui';

abstract class AppColors {
  // Color primary;
}

class AppLightColors extends AppColors {
  static final Color primary = Color(0xff4a55a7);
  static final Color secondary = Color(0xffBFDBFE);

  static final Color background = Color(0xfff9f9f9);
  static final Color forground = Color(0xff262931);

  static final Color error = Color(0xffE12E0D);
  static final Color success = Color(0xff00B37E);

  static final Color button = Color(0xff1A5CFF);
  static final Color disabledButton = Color(0xffA3BEFF);

  static final Color white = Color(0xffFFFFFF);
  static final Color black = Color(0xff000000);
}

class AppDarkColors extends AppColors {
  static final Color primary = Color(0xff6371DE);
  static final Color secondary = Color(0xff1E293B);

  static final Color background = Color(0xff181818);
  static final Color forground = Color(0xffFFFFFF);

  static final Color error = Color(0xffE12E0D);
  static final Color success = Color(0xff00B37E);

  static final Color button = Color(0xff1A5CFF);
  static final Color disabledButton = Color(0xffA3BEFF);

  static final Color white = Color(0xffFFFFFF);
  static final Color black = Color(0xff000000);
}
