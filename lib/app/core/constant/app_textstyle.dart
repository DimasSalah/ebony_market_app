part of 'constant.dart';

class Poppins {
  static TextStyle regular = GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: Tz.small,
  );

  static TextStyle medium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: Tz.small,
  );

  static TextStyle semiBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: Tz.medium,
  );

  static TextStyle bold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: Tz.large,
  );
}

class Tz {
  static const double small = 12;
  static const double medium = 14;
  static const double large = 16;
  static const double xlarge = 18;
}
