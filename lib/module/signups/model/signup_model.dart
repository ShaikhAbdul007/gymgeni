class SignupModel {
  String id;
  String name;
  String email;
  String phone;
  String gymName;
  String address;
  DateTime createdAt;
  SignupModel(
      {required this.name,
      required this.gymName,
      required this.phone,
      required this.email,
      required this.address,
      required this.id,
      required this.createdAt});

  factory SignupModel.fromJson(Map<String, dynamic> map) {
    return SignupModel(
      id: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      gymName: map['phone'] ?? '',
      address: map['address'] ?? '',
      createdAt: map['createdAt'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'gymName': gymName,
      'address': address,
    };
  }
}
