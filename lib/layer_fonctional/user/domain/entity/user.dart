import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:faker/faker.dart';

import '../../../../layer_technical/extension/string_extension.dart';

@CopyWith()
class User {
  final int id;

  final String email;

  final String lastName;

  final String firstName;

  String get fullName =>
      "${firstName.capitalizeFirst} ${lastName.toUpperCase()}";

  String get firstNameWithPartialLastName =>
      "${firstName.capitalizeFirst} ${lastName[0].toUpperCase()}.";

  factory User.faker({int seed = 1}) {
    final faker = Faker.withGenerator(RandomGenerator(seed: seed));

    return User(
      id: seed,
      email: faker.internet.email(),
      lastName: faker.person.lastName(),
      firstName: faker.person.firstName(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  User({
    required this.id,
    required this.email,
    required this.lastName,
    required this.firstName,
  });
}
