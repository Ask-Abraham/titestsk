
class ApplicationFormModel {
  String? prefix;
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  String? nationality;
  String? idCard;
  String? mobileNumber;
  String? email;
  String? emailConform;

  ApplicationFormModel({
    this.prefix,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.nationality,
    this.idCard,
    this.mobileNumber,
    this.email,
    this.emailConform
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};

    data['prefix'] = prefix;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthDate'] = birthDate;
    data['nationality'] = nationality;
    data['idCard'] = idCard;
    data['mobileNumber'] = mobileNumber;
    data['email'] = email;
    data['emailConfirm'] = emailConform;

    return data;
  }
}