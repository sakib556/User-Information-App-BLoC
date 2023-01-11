class UserModel {
    UserModel({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.userData,
        required this.support,
    });

    int page;
    int perPage;
    int total;
    int totalPages;
    List<UserData> userData;
    Support support;

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        page: json["page"] as int ,
        perPage: json["per_page"]as int ,
        total: json["total"]as int ,
        totalPages: json["total_pages"]as int ,
        userData: List<UserData>.from(json["data"].map((x) => UserData.fromMap(x))),
        support: Support.fromMap(json["support"]),
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(userData.map((x) => x.toMap())),
        "support": support.toMap(),
    };
}

class UserData {
    UserData({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    Support({
        required this.url,
        required this.text,
    });

    String url;
    String text;

    factory Support.fromMap(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
        "text": text,
    };
}
