import 'package:faker/faker.dart';

class FakerServices {
  static var faker = Faker();

  static String fakerName() {
    return faker.person.name();
  }
}
