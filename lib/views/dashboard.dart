import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vigimafra/models/question.dart';
import 'package:vigimafra/widgets/listQuiz.dart';
import 'package:vigimafra/widgets/exportData.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final controller = StreamController<QuerySnapshot>.broadcast();
  void listAllQuiz() {
    Firestore db = Firestore.instance;
    Stream<QuerySnapshot> stream = db.collection("questions").snapshots();
    stream.listen((data) {
      controller.add(data);
    });
  }

  @override
  void initState() {
    super.initState();
    listAllQuiz();
  }
  
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var loadingQuiz = Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Text("Carregando Dados"),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 25),
            child: CircularProgressIndicator(),
          ),
        ],        
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255,29,40,56), Color.fromARGB(255,29,40,56)]
            ),
            image: new DecorationImage(
              image: new AssetImage("assets/img/background.png"),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(22.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child:Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    child: Text( 
                      'Dashboard',
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 6.0,
                            color: Color.fromARGB(200,0,0,0),
                            offset: Offset(0, 2)
                          )
                        ],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: Color.fromARGB(255,255,255,255)
                      ),
                    )
                  )
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255,238,238,238),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 1000.0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 25), 
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: StreamBuilder(
                                  stream: controller.stream,
                                  builder: (context, snapshot) {
                                    switch(snapshot.connectionState) {
                                      case ConnectionState.none :
                                      case ConnectionState.waiting :
                                        return loadingQuiz;
                                        break;
                                      case ConnectionState.active :
                                      case ConnectionState.done :
                                        if (snapshot.hasError)
                                          return Text("Não foi possível carregar os dados!");
                                      QuerySnapshot querySnapshot = snapshot.data;
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: querySnapshot.documents.length,
                                        itemBuilder: (_,index) {
                                          List<DocumentSnapshot> questions = querySnapshot.documents.toList();
                                          DocumentSnapshot documentSnapshot = questions[index];
                                          Question question = Question.fromDocumentSnapshot(documentSnapshot);
                                          return ListQuiz(
                                            question: question,
                                          );
                                        },
                                      );
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            )
                          ]
                        )
                      )
                    ),
              
                  ],
                ),
              ],
            ),
          )
        )
        
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color.fromARGB(255,255,185,0),
        foregroundColor: Color.fromARGB(255,29,40,56),
        overlayColor: Color.fromARGB(255,29,40,56),
        overlayOpacity: 0.55,
        curve: Curves.easeInOutBack,
        children: [
          SpeedDialChild( 
            child: Icon(Icons.arrow_back_ios),
            label: "Home",
            backgroundColor: Color.fromARGB(255,227,172,27),
            foregroundColor: Color.fromARGB(255,29,40,56),
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: Color.fromARGB(255,43,43,43)
            ),
            onTap: () => Navigator.pushNamed(context, "/")
          ),
          SpeedDialChild( 
            backgroundColor: Color.fromARGB(255,227,172,27),
            foregroundColor: Color.fromARGB(255,29,40,56),
            child: Icon(Icons.dvr),
            label: "Questionário",
            labelStyle: TextStyle(
              decorationColor: Color.fromARGB(255,29,40,56),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: Color.fromARGB(255,43,43,43)
            ),
            onTap: () => Navigator.pushNamed(context, "/tos")
          ),
          SpeedDialChild( 
            backgroundColor: Color.fromARGB(255,227,172,27),
            foregroundColor: Color.fromARGB(255,29,40,56),
            child: Icon(Icons.unarchive),
            label: "Exportar dados",
            labelStyle: TextStyle(
              decorationColor: Color.fromARGB(255,29,40,56),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: Color.fromARGB(255,43,43,43)
            ),
            onTap: () => {
              getCsv()
            }
          ),
        ]
      )
    );
    
  }
}