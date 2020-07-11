import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255,29,40,56),
            image: new DecorationImage(
              image: new AssetImage("assets/img/background.png"),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 35, // 35%
                  child: Container(), // só é usado como margin-top (35%)
                ),
                Expanded(
                  flex: 18, // 18%
                  child:  Align(
                  alignment: Alignment.topLeft,
                    child: Text(
                      'Vigimafra',
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
                        fontSize: 70.0,
                        color: Color.fromARGB(255,227,172,27)
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 47, // 25%
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sistema de vigilância de fatores de risco para doenças crônicas',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 6.0,
                                color: Color.fromARGB(200,0,0,0),
                                offset: Offset(0, 2)
                              )
                            ],
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            color: Color.fromARGB(255,255,255,255)
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Container(margin: EdgeInsets.only(top: 5),
                          child: Text(
                            'Prefeitura de Mafra',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 6.0,
                                  color: Color.fromARGB(200,0,0,0),
                                  offset: Offset(0, 2)
                                )
                              ],
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 16.0,
                              color: Color.fromARGB(255,180,180,180)
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child:Container(margin: EdgeInsets.only(top: 50),
                          child: Row(
                            // botões
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                color: Color.fromARGB(255,227,172,27),
                                textColor: Color.fromARGB(255,16,29,50),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                shape: RoundedRectangleBorder(side: BorderSide(
                                  color: Color.fromARGB(255,227,172,27),
                                  width: 3,
                                  style: BorderStyle.solid
                                ), borderRadius: BorderRadius.circular(50)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/dashboard");
                                },
                                child: Text(
                                  "Dashboard",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              FlatButton(
                                textColor: Color.fromARGB(255,255,255,255),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                shape: RoundedRectangleBorder(side: BorderSide(
                                  color: Color.fromARGB(255,227,172,27),
                                  width: 3,
                                  style: BorderStyle.solid
                                ), borderRadius: BorderRadius.circular(50)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/tos");
                                },
                                child: Text(
                                  "Questionário",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500
                                  ),
                                  
                                ),
                              )
                            ]
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}