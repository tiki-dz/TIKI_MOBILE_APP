import 'dart:math';

class UserModel {
  String firstName;
  String lastName;
  String? phoneNumber;
  String birthDate;
  String email;
  String? sexe;
  String? city;
  String? picture;

  UserModel(
      {required this.firstName,
       required this.lastName,
       required this.phoneNumber,
       required this.birthDate,
       required this.email,
       required this.sexe,
       required this.city,
       required this.picture});

  factory UserModel.fromJson(Map<String, dynamic> item) {
    return UserModel(
        firstName: item["firstName"].toString(),
        lastName: item["lastName"].toString(),
        phoneNumber: item["phoneNumber"].toString(),
        email: item["AccountEmail"].toString(),
        birthDate: item["birthDate"].toString(),
        picture: item["profilePicture"].toString(),
        city: item["city"].toString(),
        sexe: item["sexe"] == 1 ? "Homme" : "Femme");
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "birthDate":birthDate,
      "email":email,
      "sexe":sexe,
      "city": city,
      "picture":picture
    };
  }
}
