import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/preguntas_provider.dart';

class AplicarEncuesta extends StatefulWidget {
  final String _idencuesta;

  AplicarEncuesta(this._idencuesta, {Key key}) : super(key: key);

  @override
  _AplicarEncuestaState createState() => _AplicarEncuestaState();
}

class _AplicarEncuestaState extends State<AplicarEncuesta> {
  @override
  final _preguntaProv = new PreguntasProvider();

  final List<dynamic> aux = [];

  @override
  void initState() {
    super.initState();
    var aux = widget._idencuesta.replaceAll('[', '');
    var url = aux.replaceAll(']', '');

    _preguntaProv.getPreguntas(url).then((value) {
      setState(() {
        _preguntaProv.setPreguntasList(value);
      });
    });
  }

  Widget build(BuildContext context) {
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
              itemCount:
                  3, //_preguntaProv.listaPreguntas==null ? 0: _preguntaProv.listaPreguntas.length,
              itemBuilder: (BuildContext context, index) {
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
                        Text(
                          'SECCION : $index' + '/2',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold, //w200,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        //for (int j=0;j<_preguntaProv.listaPreguntas[index].length;j++)
                        for (int j = 0; j < 2; j++)
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(0.1),
                            child: Column(
                              children: [
                                Text(
                                  '$j.- ¿ Pregunta ' + '?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ), //captura las preguntas'),
                                //if index == 0 ? Container(): Container(),

                                //for (int i=0;i<_preguntaProv.listaPreguntas[index][j]['optionRespuesta'].length;i++)
                                for (int i = 0; i < 3; i++)
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          // '$i - '+_preguntaProv.listaPreguntas[index][j]['optionRespuesta'][i].toString(),
                                          '$i   respuestas',
                                          //'R$i',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            //fontWeight: FontWeight.bold
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        MaterialButton(
                                          height: 7,
                                          minWidth: 7,
                                          shape: CircleBorder(
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                  style: BorderStyle
                                                      .solid)), // StadiumBorder(),
                                          color: Colors.white,
                                          splashColor: Colors.lightBlueAccent,

                                          //  hoverColor : Colors.black,
                                          onPressed: () {}, //C
                                          child: Text(''),
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),

                  // child: Container(
                  //   width: 210,
                  //   height: 90,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFF94CCF9), //light blue
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(45),
                  //       bottomLeft: Radius.circular(45),
                  //     ),
                  //   ),
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     'Challenge',
                  //     style: TextStyle(
                  //       fontSize: 32,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
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
