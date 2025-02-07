import 'package:gap/gap.dart';

extension SizedboxExtension on int? {
  int validate({int? defaultValue = 0}) {
    return this ?? defaultValue!;
  }

  Gap get s => Gap(this?.toDouble() ?? 0);
}
