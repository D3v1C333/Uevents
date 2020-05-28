class Data {
  String uid;
  String title;
  String shortDescription;
  String description;
  String organizer;
  String address;
  String picture;

  Data(this.uid,this.title, this.description, this.organizer, this.address,
      this.shortDescription, this.picture);

  Data copy() {
    return Data(this.uid, this.title, this.description, this.organizer,
        this.address, this.shortDescription, this.picture);
  }

  Data.fromJson(String uid, Map<String, dynamic> data){
    uid = uid;
    title = data['title'];
    shortDescription = data['shortDescription'];
    description = data['description'];
    organizer = data['organizer'];
    address = data['address'];
    picture = data['picture'];
  }

   Map<String, dynamic> toMap(){
    return {
      "title": title,
      "description": description,
      "shortDescription": shortDescription,
      "organizer": organizer,
      "uid": uid,
      "address": address,
      "picture": picture,
    };
  }
}

