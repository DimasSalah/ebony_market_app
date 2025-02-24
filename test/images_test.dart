import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ebony_market_app/app/core/utils/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.banner1).existsSync(), isTrue);
    expect(File(Images.banner2).existsSync(), isTrue);
    expect(File(Images.dummyEvent1).existsSync(), isTrue);
    expect(File(Images.dummyEvent2).existsSync(), isTrue);
    expect(File(Images.dummyEvent3).existsSync(), isTrue);
    expect(File(Images.dummyFeed1).existsSync(), isTrue);
    expect(File(Images.dummyFeed2).existsSync(), isTrue);
    expect(File(Images.dummyFeed3).existsSync(), isTrue);
  });
}
