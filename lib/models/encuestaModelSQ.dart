import 'dart:convert';

//EncuestaModelQlite encuestaModelQliteFromJson(String str) => EncuestaModelQlite.fromJson(json.decode(str));

//String encuestaModelQliteToJson(EncuestaModelQlite data) => json.encode(data.toJson());

class EncuestaModelQlite {
    EncuestaModelQlite({
        this.id,
        this.encuesta,
        this.estado,
    });

    int id;
    dynamic encuesta;
    //String encuesta;
    String estado;

    factory EncuestaModelQlite.fromJson(Map<String, dynamic> json) => EncuestaModelQlite(
        id: json["id"],
        encuesta: json["encuesta"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "encuesta": encuesta,
        "estado": estado,
    };
}
