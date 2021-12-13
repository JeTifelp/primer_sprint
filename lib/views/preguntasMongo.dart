

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/models/usuario.dart';
import 'package:flutter_application_2/providers/preguntas_provider.dart';
import 'package:flutter_application_2/providers/registro_provider.dart';
import 'package:flutter_application_2/providers/test_provider.dart';

class PreguntasMongo extends StatefulWidget {
  final String _idencuesta;
  
  PreguntasMongo(this._idencuesta,{Key key}) : super(key: key);

 @override
  _PreguntasMongoState createState() => _PreguntasMongoState();
}
class _PreguntasMongoState extends State<PreguntasMongo> {
  //para login
// final _usuarioProvider= new UsuarioProvider();
// final String email = FirebaseAuth.instance.currentUser.email;
// final usuarioLogout= FirebaseAuth.instance.signOut();
  @override
  final _preguntaProv= new PreguntasProvider();

  final List<dynamic> aux =[];







   @override
   void initState() {
     super.initState();
     var aux=widget._idencuesta.replaceAll('[', '');
    var url=aux.replaceAll(']', '');

     _preguntaProv.getPreguntas(url).then((value){
      setState(() {
        _preguntaProv.setPreguntasList(value);
      });

    } );
     
   }
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title: Text("Preguntass-Mongo"),
        actions: [
          IconButton(
            onPressed:(){}, 
            icon: Icon(Icons.notifications)
            ),
          IconButton(
            onPressed:(){}, 
            icon: Icon(Icons.search)
            )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
        elevation: 20,
      ),

      body: preguntasPage(),
    );
  }
Widget preguntasPage() {
    return Container(
      color: Colors.black26,
      child: Center(
        child: ListView.builder(
          itemCount:_preguntaProv.listaPreguntas==null ? 0: _preguntaProv.listaPreguntas.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(//click en un card para navegar a otro widget
                                  // onLongPress: (){//ontap
                                  //  print(_preguntaProv.listaPreguntas[index]['name'].toString());// _ListPrueba[index].id);
                                  //   //Navigator.of(context).pop();
                                    
                                      
                                  // },

                                  child: Container(
                                    decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.black12,Colors.white70
                                      // Color(0x11111111),
                                      // Color(0xFF2979FF),
                                      // Color(0xFFC8E6C9),
                                    ])),
                                    padding: EdgeInsets.all(15),
                                  //   decoration: BoxDecoration(
                                  //     border: Border(
                                  //       bottom: BorderSide( color: Colors.blue, width:1
                                  //       )
                                  //   ),
                                  // ),
                                  
                                  child:Column(
                                      children: [
                                          
                                        Text(
                                         //''+_preguntaProv.listaPreguntas[index][index]['name'].toString() ,
                                         'SECCION : $index',
                                        //'¿'+_preguntaProv.listaPreguntas[index].toString()+'?',
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                         ),
                                        
                                      ),
                                      for (int j=0;j<_preguntaProv.listaPreguntas[index].length;j++)
                                       
                                       
                                      Container(
                                        //height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        //width: double.infinity,
                                        child:Column(
                                          children: [
                                      
                                          Container(
                                            width: double.infinity,
                                            child: Text(
                                                //Desplegmos las Preguntas de cada seccion
                                                  '$j.- ¿'+_preguntaProv.listaPreguntas[index][j]['name'].toString()+'?',//captura las preguntas
                                                  //'¿'+_preguntaProv.listaPreguntas[index][j]['optionRespuesta'].toString(),
                                                    style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold                                          
                                                  ),
                                                  
                                              ),
                                          ),
                                          
                                        for (int i=0;i<_preguntaProv.listaPreguntas[index][j]['optionRespuesta'].length;i++)
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:  Colors.white24,
                                               
                                              ),
                                              borderRadius: BorderRadius.circular(15)
                                            ),
                                            child:Row(
                                              
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,                                              
                                              children: <Widget>[
                                                Text(
                                                      '$i - '+_preguntaProv.listaPreguntas[index][j]['optionRespuesta'][i].toString(),
                                                      //'R$i',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          //fontWeight: FontWeight.bold
                                                        ),  
                                                      
                                                ),
                                              
                                                MaterialButton(
                                                  
                                                  shape: CircleBorder(
                                                        side: BorderSide(
                                                        color: Colors.black, 
                                                        width: 1.0,style:
                                                         BorderStyle.solid)
                                                      ),// StadiumBorder(),
                                                  color: Colors.deepOrange,
                                                  hoverColor : Colors.black,
                                                  onPressed: (){},       //C
                                                  child: Text(''),
                                                )

                                              ],
                                            ),
                                             
                                          
                                        )

                                          ],

                                        ),
                                          
                                        
                                      ),
                                      //https://www.youtube.com/watch?v=N-Jw-Nf_gZ0
                                      
                                      

                                      FlatButton(
                                        color: Colors.redAccent,
                                        onPressed: (){}, 
                                        child: Text('Guardar')
                                        )    
                                      ],
                                    ),
                                    
                                  ),
                                );
          },
        ),
        // child: ListView(
        //   children: [
            
        //     SizedBox(
        //       height: 20,
        //     ),
        //     Center(
        //       child: Text(
        //         "LOGIN",
        //         style: TextStyle(
        //             color: Colors.orange,
        //             fontSize: 45,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
            
        //     crearBoton
        // Login(),
            
            
        //   ],
        // ),
      ),
    );
  }
Widget OptRespueta(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),

    ),
    child: Column(
      children: [
        Text(
          '¿ ?',
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
        ),
      ],
    ),
  );
}
Widget miCard(String titulo,String description) {
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
          title: Text(titulo,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),
          ),
          subtitle: Text(
               description
              ),
          leading: Icon(Icons.poll,size: 80,color:Colors.red ,),
        ),
        
        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () { 
                    //            PruebaProvider p = new PruebaProvider();
                    //  p.getDataMedico();
                     }, child: Text('Aceptar')),
            FlatButton(onPressed: () => {}, child: Text('Cancelar'))
          ],
        )
      ],
    ),
  );
}
//__________MENU_______
// Widget drawerPage() {
//   return Drawer(
    
//     child: ListView(
//         children: <Widget>[
//           Text('Usuario'),
//           DrawerHeader(
//             child: Container(
//               color: Colors.green[100],
//               child: FutureBuilder(
//                 future: _usuarioProvider.getUsuario(email),                
//                 builder: (BuildContext context, AsyncSnapshot <Usuario>snapshot) {
//                   if(snapshot.hasData){
//                     return Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(
//                           snapshot.data.foto                        
//                            ) ,
//                         ),
//                         ListTile(
//                           title:  Text(
//                             snapshot.data.nombre

//                           ),
//                           subtitle: Text( email)
//                         )

//                       ],
//                     );
//                   }else{
//                     return Center( child:CircularProgressIndicator() );
//                   }
//                   //return ;
//                 },
//               ),
//             )
//           ),
//           cuerpoDraw()
//         ],
//       ),
//   );

// }

// Widget cuerpoDraw() {
//     return Container(
//       color: Colors.orange[100],
//       child: Column(
//         children: [
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Inicio"),
//             trailing: Icon(Icons.keyboard_arrow_right),
//           ),
//           ListTile(
//               title: Text("Cerrar Sesión"),
//               leading: Icon(Icons.person),
//               trailing: Icon(Icons.keyboard_arrow_right),
//               onTap: () {
//                 usuarioLogout.then((value) => showToast(context,'El Usuario a cerrado Sesión..!!'));
//                 Navigator.popAndPushNamed(context, '/inicio');
//               }),
       
//         ],
//       ),
//     );
//   }

//   void showToast(BuildContext context, String mensaje) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(mensaje),
//       duration: Duration(seconds: 3),
//     ));
//   }



  
}//fin de clase




