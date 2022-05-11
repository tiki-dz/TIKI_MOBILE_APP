class PersonModel{
  String firstName;
  String lastName;
  String phoneNumber;

  PersonModel({required this.firstName,required this.lastName,required this.phoneNumber});

  String abr(){
    return lastName[0] + "." + firstName;
  }

}