import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ebony_market_app/app/core/utils/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.banner1).existsSync(), isTrue);
    expect(File(Images.banner2).existsSync(), isTrue);
  });
}
