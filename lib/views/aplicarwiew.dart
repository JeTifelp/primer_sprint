

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/preguntas_provider.dart';

class AplicarEncuesta extends StatefulWidget {
  String _idencuesta;

  AplicarEncuesta(this._idencuesta, {Key key}) : super(key: key);

  @override
  _AplicarEncuestaState createState() => _AplicarEncuestaState();
}

class _AplicarEncuestaState extends State<AplicarEncuesta> {
  @override
  final _preguntaProv = new PreguntasProvider();

   String _idEncuesta='';

  final List<dynamic> _listSeleccion = [];
  bool _checkBoxValue = false;
  int _valueRadio = 0;
  String _cad = '';

  @override
  void initState() {
    super.initState();
    var aux = widget._idencuesta.replaceAll('[', '');
    var url = aux.replaceAll(']', '');
    _idEncuesta = url;

    _preguntaProv.getPreguntas(url).then((value) {
      setState(() {
        _preguntaProv.setPreguntasList(value);
      });
    });
  }

  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicar Encuesta"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        elevation: 20,
      ),
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: PageView.builder(
              itemCount: _preguntaProv.listaPreguntas == null
                  ? 0
                  : _preguntaProv.listaPreguntas.length,
              itemBuilder: (BuildContext context, index) {
                count = index + 1;

                return Container(
                  color: Color(0xFF272A3C),
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  child:
                      // Text('algo'+position.toString()),
                      Container(
                    margin: EdgeInsets.all(15),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(20),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                      ),
                      gradient: new LinearGradient(
                        colors: [
                          Color(0xFFFF422C),
                          Color(0xFFFF9003),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.25, 0.90],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF101012),
                          offset: Offset(-12, 12),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    alignment: Alignment
                        .topCenter, //Alignment.centerLeft, //to align its child
                    padding: EdgeInsets.all(20),

                    child: Column(
                      children: [
                        // Pegar aqui codigo comleto
                        Expanded(
                          child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    //==========================================

                                    Text(
                                      'SECCION : $count' +
                                          '/' +
                                          _preguntaProv.listaPreguntas.length
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold, //w200,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                    for (int j = 0;
                                        j <
                                            _preguntaProv
                                                .listaPreguntas[index].length;
                                        j++)
                                      //for (int j = 0; j < 2; j++)
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(0.1),
                                        child: Column(
                                          children: [
                                            Text(
                                              //'$j.- ¿ Pregunta ' + '?',
                                              '$j.- ¿' +
                                                  _preguntaProv
                                                      .listaPreguntas[index][j]
                                                          ['name']
                                                      .toString() +
                                                  '?', //captura las preguntas
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ), //captura las preguntas'),
                                            //if index == 0 ? Container(): Container(),  [j]['multiple']
                                            new Center(
                                                //child:_preguntaProv.listaPreguntas[index][j]['tipoPregunta']['type'].toString() == '2' ?
                                                child: _preguntaProv
                                                            .listaPreguntas[
                                                                index][j]
                                                                ['multiple']
                                                            .toString() ==
                                                        'true'
                                                    ? //si true= selecccion multiple, false=seleccion unica
                                                    new Container(
                                                        // respuestas de seleccion multiple
                                                        child: Column(
                                                          children: [
                                                            for (int i = 0;
                                                                i <
                                                                    _preguntaProv
                                                                        .listaPreguntas[
                                                                            index]
                                                                            [j]
                                                                            ['optionRespuesta']
                                                                        .length;
                                                                i++)
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      '$i - ' +
                                                                          _preguntaProv
                                                                              .listaPreguntas[index]
                                                                              [j]
                                                                              ['optionRespuesta']
                                                                              [i]['value']
                                                                              .toString(),
                                                                      
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        //fontWeight: FontWeight.bold
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                    ),
                                                                    Checkbox(
                                                                        value:
                                                                            _checkBoxValue,
                                                                        onChanged:
                                                                            (bool value) {
                                                                          print(value);

                                                                          setState(
                                                                              () {
                                                                            _checkBoxValue =!_checkBoxValue;
                                                                          });

                                                                          // _checkBoxValue = false;
                                                                        })
                                                                  ],
                                                                ),
                                                              )
                                                          ],
                                                        ),
                                                      )
                                                    : new Container(
                                                        // respuestas de seleccion simple

                                                        child: Column(
                                                          children: [
                                                            for (int i = 0;
                                                                i <
                                                                    _preguntaProv
                                                                        .listaPreguntas[
                                                                            index]
                                                                            [j][
                                                                            'optionRespuesta']
                                                                        .length;
                                                                i++)
                                                              Container(
                                                                  child:
                                                                      ListTile(
                                                                title: Text(_preguntaProv
                                                                    .listaPreguntas[
                                                                        index]
                                                                        [j][
                                                                        'optionRespuesta']
                                                                        [i][
                                                                        'value']
                                                                    .toString()),
                                                                leading: Radio(
                                                                  value: i,
                                                                  groupValue:
                                                                      _valueRadio,
                                                                  onChanged: (int
                                                                      value) {
                                                                    print(
                                                                        value);
                                                                    print(_preguntaProv.listaPreguntas[index][j]
                                                                            [
                                                                            'optionRespuesta'][i]
                                                                        [
                                                                        '_id']);
                                                                        print('id encuesta'+_idEncuesta);
                                                                    setState(
                                                                        () {
                                                                      _valueRadio =
                                                                          value;
                                                                    });
                                                                  },
                                                                ),
                                                                onTap: () {
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ))
                                                          ],
                                                        ),
                                                      )),
                                          ],
                                        ),
                                      )

                                    //==========================================
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                // child: PageView(

                // controller: PageController(viewportFraction: 1),
                // physics: BouncingScrollPhysics(),
                // children : <Widget>[
                //   Text('algo'),
                //   page(Colors.blue, 1),
                //   page(Colors.red, 2),
                //   page(Colors.green, 3),
                // ],
                )),
      ),
    );
  }

//_________________________
  Widget page(Color c, int i) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Text('' + i.toString()),
      decoration:
          BoxDecoration(color: c, borderRadius: BorderRadius.circular(20)),
    );
  }
}
