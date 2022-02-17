import 'package:flutter/material.dart';
import 'model_class.dart';
import 'services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
      title: Text("Album Fake API"),

      ),
     body: Container(
       child: FutureBuilder(
         future: ServicesApi.GetTODOS(),
         builder: (context,AsyncSnapshot<List<ModelFakeApi>> snapshot,){

           if(snapshot.hasError)
           {
             return Container(
               width: double.infinity,
               height:double.infinity,
               alignment: Alignment.center,
               child:Text("Error 33 Occured: ${snapshot.error.toString()}"),
             );
           }
           if(snapshot.connectionState==ConnectionState.waiting)
           {
             return Container(
               width: double.infinity,
               height:double.infinity,
               alignment: Alignment.center,
               child: CircularProgressIndicator(),
             );
           }
           else
           if(snapshot.connectionState==ConnectionState.done)
           {
             return Container(
               width: 500,

               alignment: Alignment.center,
               child: ListView.builder(
                   itemCount: snapshot.data!.length,
                   itemBuilder: (context,Index){
                     return
                       ListTile(
                       title: Text(snapshot.data![Index].id.toString()),
                       subtitle:  Text(snapshot.data![Index].title),
                       // trailing: Text(snapshot.data![Index].title),
                     );
                   }
               ),
             );
           }
           else

           {
             return Container(
               width: double.infinity,
               height:double.infinity,
               alignment: Alignment.center,
               child:Text("Error Occured: ${snapshot.error.toString()}"),
             );
           }
           // print("hello length${snapshot.data!.length}");
           // return Container();

         },
       ),
     ),
   );
  }
}
