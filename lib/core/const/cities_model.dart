// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

List<CitiesModel> citiesModelFromJson(String str) => List<CitiesModel>.from(json.decode(str).map((x) => CitiesModel.fromJson(x)));

String citiesModelToJson(List<CitiesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CitiesModel {
    CitiesModel({
        this.city,
        this.lat,
        this.lng,
        this.country,
        this.iso2,
        this.adminName,
        this.capital,
        this.population,
        this.populationProper,
    });

    String ?city;
    String? lat;
    String ?lng;
    String ?country;
    String ?iso2;
    String ?adminName;
    String ?capital;
    String ?population;
    String ?populationProper;
 
    factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        city: json["city"],
        lat: json["lat"],
        lng: json["lng"],
        country: json["country"],
        iso2: json["iso2"],
        adminName: json["admin_name"],
        capital:json["capital"],
        population: json["population"],
        populationProper: json["population_proper"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "lat": lat,
        "lng": lng,
        "country": country,
        "iso2": iso2,
        "admin_name": adminName,
        "capital": capital,
        "population": population,
        "population_proper": populationProper,
    };
}
