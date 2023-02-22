class AuthModel{
  String emailAdd;
  String password;
  final DateTime birthday;
  final String firstName;
  final String lastName;
  final String vloggerId;
  int areaCode;
  int telephone;

  AuthModel({
    this.emailAdd ='',
    required this.password,
    required this.birthday,
    required this.firstName,
    required this.lastName,
    required this.vloggerId,
    this.telephone=000,
    this.areaCode=000

    
    

  });
}