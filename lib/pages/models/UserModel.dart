class UserModel {
  String? uid;
  String? fullname;
  String? username;

  UserModel({this.uid, this.fullname, this.username});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["nama_lengkap"];
    username = map["username"];

  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "nama_lengkap": fullname,
      "username": username,
    };
  }
}
