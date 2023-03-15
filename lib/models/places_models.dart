// To parse this JSON data, do
//
//     final placesResponse = placesResponseFromJson(jsonString);

import 'dart:convert';

class PlacesResponse {
    PlacesResponse({
        required this.type,
        required this.query,
        required this.features,
        required this.attribution,
    });

    final String type;
    final List<double> query;
    final List<Feature> features;
    final String attribution;

    factory PlacesResponse.fromRawJson(String str) => PlacesResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
        type: json["type"],
        query: List<double>.from(json["query"].map((x) => x?.toDouble())),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
    };
}

class Feature {
    Feature({
        required this.id,
        required this.type,
        required this.placeType,
        required this.relevance,
        required this.properties,
        required this.text,
        required this.placeName,
        required this.center,
        required this.geometry,
        required this.context,
    });

    final String id;
    final String type;
    final List<String> placeType;
    final int relevance;
    final Properties properties;
    final String text;
    final String placeName;
    final List<double> center;
    final Geometry geometry;
    final List<Context> context;

    factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"],
        properties: Properties.fromJson(json["properties"]),
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
        context: List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
        "context": List<dynamic>.from(context.map((x) => x.toJson())),
    };
}

class Context {
    Context({
        required this.id,
        required this.mapboxId,
        required this.text,
        this.wikidata,
        this.shortCode,
    });

    final String id;
    final String mapboxId;
    final String text;
    final String? wikidata;
    final String? shortCode;

    factory Context.fromRawJson(String str) => Context.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json["id"],
        mapboxId: json["mapbox_id"],
        text: json["text"],
        wikidata: json["wikidata"],
        shortCode: json["short_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mapbox_id": mapboxId,
        "text": text,
        "wikidata": wikidata,
        "short_code": shortCode,
    };
}

class Geometry {
    Geometry({
        required this.type,
        required this.coordinates,
    });

    final String type;
    final List<double> coordinates;

    factory Geometry.fromRawJson(String str) => Geometry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class Properties {
    Properties({
        required this.accuracy,
    });

    final String accuracy;

    factory Properties.fromRawJson(String str) => Properties.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        accuracy: json["accuracy"],
    );

    Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
    };
}
