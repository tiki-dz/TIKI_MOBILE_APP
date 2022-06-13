class RegistrationModel{
  String name;
  String lastName;
  String birthDay;
  String email;
  String password;
  String phoneNumber;


  RegistrationModel(this.name, this.lastName, this.birthDay, this.email,
      this.password,this.phoneNumber);

  @override
  String toString() {
    return 'RegistrationModel{name: $name, lastName: $lastName, birthDay: $birthDay, email: $email, password: $password, phoneNumber: $phoneNumber}';
  }
}