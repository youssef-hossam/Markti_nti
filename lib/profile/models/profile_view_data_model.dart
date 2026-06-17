class ProfileViewDataModel {
  String? userId;
  String? email;
  String? fullName;
  Null? profilePicture;

  ProfileViewDataModel(
      {this.userId, this.email, this.fullName, this.profilePicture});

  ProfileViewDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    fullName = json['fullName'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['profilePicture'] = this.profilePicture;
    return data;
  }
}