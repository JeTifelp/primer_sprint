//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PreguntasProvider{

  //https://reqres.in/api/users?page=2

  Map data;
   List _listPreguntas=[];
   List _listSections=[];


  Future<List> getPreguntas(String _idencuesta)async{
    //print('idid : '+_idencuesta);
     //final _url = 'https://encuestas-rest-api-server2.herokuapp.com/api/v1/encuestas/$_idencuesta';//  url Poste
     final _url = 'https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas/$_idencuesta';//final _url= 'https://reqres.in/api/users?page=2' ;
     //print(_url);
    // print('__https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas/61a559b35c0a0c0aa0b23645');
   
        final resp = await http.get(Uri.parse(_url)).timeout(Duration(seconds: 90));
        
        final Map<String, dynamic> body=jsonDecode(resp.body);//extraer body devuelve dynamic     result es un mapa
        //print('id : $_idencuesta'+'-> encuesta: ${ body['encuesta']['sections']} ');  
      
        // print('data: ${ body['data'][2]['id']} ');  
        String succes= body['success'].toString();
        print(succes);
        List _listaux=[];
         if(succes== 'true'){      
           _listSections=body['encuesta']['sections'];//[0]['questions'];//captura de toda el Json de seccion  
          //print('___________________________'+body['encuesta']['sections'][0]['name']);

           for (var i = 0; i < _listSections.length; i++) {
             //_listPreguntas= body['encuesta']['sections'][i]['questions'];
             _listaux.add( body['encuesta']['sections'][i]['questions']);//saco toda la lista de preguntas de cada seccion
             var a= body['encuesta']['sections'][i]['name'].toString();
             var b=body['encuesta']['sections'][i]['questions']           ;
           print('lista seccion $i -> $a :'+_listPreguntas.toString());               
           print(' preguntas $b');
           }



           
          // print('lista secciones'+_listSections.toString());
         }
         print('___________________________');
         print('cantidad de secciones '+_listSections.length.toString());
         print('___Pregunas seccion _  '+ _listaux.toString());
      return _listaux;// Devuele lista de preguntas en cada seccion   L= [ [sec1],[sec2] ]
  }


List get listaPreguntas => _listPreguntas;
List get listaSecciones => _listSections;


setPreguntasList(List list){
  _listPreguntas=list;
  
}

setSeccionesList(List list){
  _listSections=list;
  
}

}//fin clase