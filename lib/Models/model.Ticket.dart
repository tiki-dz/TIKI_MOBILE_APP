class TicketModel{
  String firstName;
  String lastName;
  String phoneNumber;
  String QRCode;

  TicketModel(
      {required this.firstName,required this.lastName, required this.phoneNumber,required this.QRCode});


  factory TicketModel.fromJson(Map<String,dynamic> item){
    return TicketModel(firstName: item["firstName"], lastName: item["lastName"], phoneNumber: item["phoneNumber"], QRCode: item["qrCode"]);
  }

  @override
  String toString() {
    return 'MultipleTickets{firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, QRCode: $QRCode}';
  }



}