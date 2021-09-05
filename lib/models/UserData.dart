class UserData {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserData({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final Address zipcode;
  final Geo geo;


  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'],

    );
  }
}


class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({

    this.name,
    this.catchPhrase,
    this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(

        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs']
    );
  }
}


class Geo {
  final String lat;
  final String lng;


  Geo({

    this.lat,
    this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(

        lat: json['lat'],
        lng: json['lng']
    );
  }
}