class User {
  late String firstname;
  late String lastname;
  late String phone;
  User.fromJson(Map<String, dynamic> map) {
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
    this.phone = map['phone'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      "firstname": this.firstname,
      "lastname":this.lastname,
      "phone" :this.phone,
    };
  }
/*   factory User.fromJson(Map<String, dynamic> json) => _$UserFormJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this); */
}
