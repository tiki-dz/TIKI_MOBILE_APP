class ModelTicket{
  String firstName;
  String lastName;
  String phoneNumber;
  String QRCode;

  ModelTicket(
      {required this.firstName,required this.lastName, required this.phoneNumber,required this.QRCode});

  
  factory ModelTicket.fromJson(Map<String,dynamic> item){
    return ModelTicket(firstName: item["firstName"], lastName: "lastName", phoneNumber: "phoneNumber", QRCode: "qrCode");
  }
  
  @override
  String toString() {
    return 'MultipleTickets{firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, QRCode: $QRCode}';
  }
  
  
}