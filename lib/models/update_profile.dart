import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) => UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  UpdateProfile({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.avatar,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.mobileNumber,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.aboutYou,
    this.resume,
    this.fieldsOfInterest,
    this.skills,
    this.language,
    this.qualification,
    this.other,
    this.status,
    this.permission,
    this.userType,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String avatar;
  String firstName;
  String lastName;
  String email;
  dynamic emailVerifiedAt;
  String phoneNumber;
  String mobileNumber;
  DateTime dateOfBirth;
  String gender;
  String address;
  String aboutYou;
  dynamic resume;
  String fieldsOfInterest;
  String skills;
  String language;
  String qualification;
  String other;
  int status;
  dynamic permission;
  String userType;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    avatar: json["avatar"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phoneNumber: json["phone_number"],
    mobileNumber: json["mobile_number"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    address: json["address"],
    aboutYou: json["about_you"],
    resume: json["resume"],
    fieldsOfInterest: json["fields_of_interest"],
    skills: json["skills"],
    language: json["language"],
    qualification: json["qualification"],
    other: json["other"],
    status: json["status"],
    permission: json["permission"],
    userType: json["user_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone_number": phoneNumber,
    "mobile_number": mobileNumber,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "address": address,
    "about_you": aboutYou,
    "resume": resume,
    "fields_of_interest": fieldsOfInterest,
    "skills": skills,
    "language": language,
    "qualification": qualification,
    "other": other,
    "status": status,
    "permission": permission,
    "user_type": userType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
