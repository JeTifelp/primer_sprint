import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/usuario.dart';
import 'package:flutter_application_2/providers/db_provider.dart';
import 'package:flutter_application_2/providers/encuesta_provider.dart';
import 'package:flutter_application_2/providers/registro_provider.dart';
import 'package:flutter_application_2/views/aplicarwiew.dart';
import 'package:flutter_application_2/views/preguntasMongo.dart';
import 'package:flutter_application_2/views/testseccion.dart';

//  otra opcion de login
class HomePageMongo extends StatefulWidget {
  @override
  _MyHomePageMongoState createState() => _MyHomePageMongoState();
}

class _MyHomePageMongoState extends State<HomePageMongo> {
  final _emailController = TextEditingController();
  final _passworController = TextEditingController();

//para login
  final _usuarioProvider = new UsuarioProvider();
  final String email = FirebaseAuth.instance.currentUser.email;
  final usuarioLogout = FirebaseAuth.instance.signOut();

//var

  final _encuestaProv = new EncuestaProvider();

  update() {
    // _encuestaProv.getEncuesta().then((value) {
    //   setState(() {
    //     _encuestaProv.setPEncuestasList(value);
    //   });
    // });

  _encuestaProv.readInSqlite().then((value) {
      setState(() {
        _encuestaProv.setPEncuestasList(value);
      });
    });

  }

//_______________________
  @override
  void initState() {
    update();
    // super.initState();
    // _encuestaProv.getEncuesta().then((value){
    //   setState(() {
    //     _encuestaProv.setPEncuestasList(value);
    //   });

    // } );

    // _encuestaProv.listar().then((value){
    //   setState(() {
    // _encuestaProv.setEncuestaAllList(value);

    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomeePage_Mongo"),
          actions: [
            IconButton(
                onPressed: () {
                  update();
                },
                icon: Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          elevation: 20,
        ),
        //padding: EdgeInsets.all(15),
        body: FutureBuilder<List<EncuestaModelQlite>>(
          future: DBProvider.db.getTodoEncuestas(),          
          builder: (BuildContext context, AsyncSnapshot<List<EncuestaModelQlite>> snapshot) {
            if (!snapshot.hasData ){
              return Center(child: CircularProgressIndicator());
            }
            final encuest= snapshot.data;
            if( encuest.length == 0){
              return Center(
                child: Text('no hay informacion'),
              );
            }
            return ListView.builder(
              itemCount: encuest.length,
              itemBuilder:(context,i) => ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text(encuest[i].encuesta+encuest[i].encuesta[8]),
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.red,),

              )
              );


          },
        ),

        //AQUI
        // Column(
        //   children: [
        //     Text(' Total Encuestas : ' +
        //         _encuestaProv.listEncuestas.length.toString()),
        //     Expanded(
        //       child: ListView.builder(
        //           itemCount: _encuestaProv.listEncuestas == null
        //               ? 0
        //               : _encuestaProv
        //                   .listEncuestas.length, //_ListPrueba.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             //return devuelve el widget que nosotros queremos ver
        //             return InkWell(
        //               //click en un card para navegar a otro widget
        //               onLongPress: () {
        //                 //ontap
        //                 print(_encuestaProv.listEncuestas[index]['sections']
        //                     .toString()); // _ListPrueba[index].id);
        //                 //Navigator.of(context).pop();
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => PreguntasMongo(_encuestaProv
        //                           .listEncuestas[index]['_id']
        //                           .toString())),
        //                 );
        //               },

        //               child: Container(
        //                   decoration: BoxDecoration(
        //                       gradient: LinearGradient(
        //                           begin: Alignment.topLeft,
        //                           end: Alignment.bottomRight,
        //                           colors: [
        //                         Colors.black12, Colors.white70
        //                         // Color(0x11111111),
        //                         // Color(0xFF2979FF),
        //                         // Color(0xFFC8E6C9),
        //                       ])),
        //                   padding: EdgeInsets.all(15),
                        
        //                   //child: miCard2(context,_encuestaProv, index),
        //                   // child: miCard(
        //                   //     _encuestaProv.listEncuestas[index]['name']
        //                   //         .toString(),
        //                   //     _encuestaProv.listEncuestas[index]['description']
        //                   //         .toString()), //_ListPrueba[index].title),
                        
        //                   child: Card(                        
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(10)),
        //                     color: Colors.green[100],                            
        //                     margin: EdgeInsets.all(15),
                            
        //                     elevation: 10,                            
        //                     child: Column(
        //                       children: <Widget>[                                
        //                         ListTile(
        //                           contentPadding:
        //                               EdgeInsets.fromLTRB(15, 10, 25, 0),
        //                           title: Text(
        //                             _encuestaProv.listEncuestas[index]['name'],
        //                             style: TextStyle(
        //                                 color: Colors.black,
        //                                 fontSize: 25,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           subtitle: Text(_encuestaProv
        //                               .listEncuestas[index]['description']),
        //                           leading: Icon(
        //                             Icons.poll,
        //                             size: 80,
        //                             color: Colors.red,
        //                           ),
        //                         ),                                
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.end,
        //                           children: <Widget>[
        //                             FlatButton(
        //                                 onPressed: () {
        //                                   Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                         builder: (context) =>
        //                                             PreguntasMongo(_encuestaProv
        //                                                 .listEncuestas[index]
        //                                                     ['_id']
        //                                                 .toString())),
        //                                   );
        //                                 },
        //                            child: Text('Ver ')),
        //                             FlatButton(
        //                                 onPressed: () {
        //                                   Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                         builder: (context) =>
        //                                             AplicarEncuesta(
        //                                                 _encuestaProv
        //                                                     .listEncuestas[
        //                                                         index]['_id']
        //                                                     .toString())),
        //                                   );
        //                                 },
        //                                 child: Text('Aplicar'))
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   )),
        //             );
        //           }),
        //     )
        //   ],
        // ),
//AQUI
        ///Aqui el lisvie A

        drawer: drawerPage());
  } //fin BUild

//______________
  Widget miCard(String titulo, String description) {
    //https://andygeek.com/posts/Fundamentos%20de%20Flutter/posts/Creando-cards-en-flutter/
    return Card(
      // Con esta propiedad modificamos la forma de nuestro card
      // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.green[100],
      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: EdgeInsets.all(15),
      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 10,

      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones
      child: Column(
        children: <Widget>[
          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              titulo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(description),
            leading: Icon(
              Icons.poll,
              size: 80,
              color: Colors.red,
            ),
          ),

          // Usamos una fila para ordenar los botones del card
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    //            PruebaProvider p = new PruebaProvider();
                    //  p.getDataMedico();
                  },
                  child: Text('Ver ')),
              FlatButton(onPressed: () => {}, child: Text('Aplicar'))
            ],
          )
        ],
      ),
    );
  }

  Widget miCard2(BuildContext context, EncuestaProvider e, int index) {
    //https://andygeek.com/posts/Fundamentos%20de%20Flutter/posts/Creando-cards-en-flutter/
    return Card(
      // Con esta propiedad modificamos la forma de nuestro card
      // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.green[100],
      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: EdgeInsets.all(15),
      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 10,

      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones
      child: Column(
        children: <Widget>[
          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              e.listEncuestas[index]['name'],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(e.listEncuestas[index]['description']),
            leading: Icon(
              Icons.poll,
              size: 80,
              color: Colors.red,
            ),
          ),

          // Usamos una fila para ordenar los botones del card
          Row(
            // card 222
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    print('ver ver' +
                        e.listEncuestas[index]['id'].toString().toString());
                    print('descrip' +
                        e.listEncuestas[index]['description'].toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PreguntasMongo(
                                e.listEncuestas[index]['id'].toString(),

                                // _encuestaProv
                                //   .listEncuestas[index]['_id']
                                //   .toString()
                              )),
                    );
                  },
                  child: Text('VVer ')),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AplicarEncuesta(
                              e.listEncuestas[index]['id'].toString()
                              // _encuestaProv
                              //   .listEncuestas[index]['_id']
                              //   .toString()
                              )),
                    );
                  },
                  child: Text('AAplicar'))
            ],
          )
        ],
      ),
    );
  }

  //______________ Menu ___________
  Widget drawerPage() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Text('Usuario'),
          DrawerHeader(
              child: Container(
            color: Colors.green[100],
            child: FutureBuilder(
              future: _usuarioProvider.getUsuario(email),
              builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data.foto),
                      ),
                      ListTile(
                          title: Text(snapshot.data.nombre),
                          subtitle: Text(email))
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
                //return ;
              },
            ),
          )),
          cuerpoDraw()
        ],
      ),
    );
  }

  Widget cuerpoDraw() {
    return Container(
      color: Colors.orange[100],
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Inicio"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
              title: Text("Cerrar Sesión"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                usuarioLogout.then((value) =>
                    showToast(context, 'El Usuario a cerrado Sesión..!!'));
                Navigator.popAndPushNamed(context, '/inicio');
              }),
        ],
      ),
    );
  }

  void showToast(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 3),
    ));
  }
}//end class


























//Listview A
// ListView(
    //    children: [
    //      Container(
    //        child: Center(
    //         child: Form(
    //           key: _formKey,
    //           child: Column(
                
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               miCard('Encuesta 1'),
    //               SizedBox(
    //                           height: 10,
    //                         ),
    //               miCard('Encuesta 2'),
    //               SizedBox(
    //                           height: 10,
    //                         ),
    //               miCard('Encuesta 3'),
                   
    //               // SizedBox(
    //               //             height: 20,
    //               //           ),
    //               textFormFieldEmail(),
    //               SizedBox(
    //                           height: 10,
    //                         ),
    //               textFormFieldPassword(),

         
         
    //               // SizedBox(
    //               //             height: 20,
    //               //           ),
         
    //               //FlatButton(onPressed: (){}, child: Text('Sumar')),
    //               RaisedButton(
    //                 child: Text('Gguardar'),
    //                 onPressed:(){
    //                  if(_formKey.currentState.validate() ){
    //                    //print('Guardar');
    //                   // DBmanager.insert(
    //                   //     //Cuenta( email: _emailController.text, password: _passworController.text )
    //                   //   );
    //                  }
    //                  PruebaProvider p= new PruebaProvider();
    //                  p.getDataMedico();
    //               }),
         
                  
    //             ],
         
              
         
              
    //           ),
              
    //           ),
    //        ),
    //      ),
    //    ],
    //  ),