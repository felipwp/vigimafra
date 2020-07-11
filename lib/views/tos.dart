import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/* import 'package:vigimafra/models/question.dart'; */

class Tos extends StatefulWidget {
  @override
  _TosState createState() => _TosState();
}



class _TosState extends State<Tos> {
  bool termsState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255,16,29,50), Color.fromARGB(255,21,42,68)]
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
                      'Termos de Serviço',
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
                        border: Border.all(
                          color: Color.fromARGB(255,238,238,238),
                          width: 8,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 1000.0,
                      margin: EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, left: 7, right: 7, bottom: 20), 
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255,255,255,255),
                                border: Border.all(
                                  color: Color.fromARGB(255,255,255,255),
                                  width: 8,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10), 
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Convidamos o Sr(a) para participar da Pesquisa VIGIMAFRA: VIGILÂNCIA DE FATORES DE RISCO PARA DOENÇAS CRÔNICAS DE MAFRA- ESTUDO PILOTO, sob a responsabilidade do pesquisador Prof. Dr. Daniel Rogério Petreça. Essa pesquisa pretende analisar os fatores de risco para doenças e agravos não-transmissíveis no seu bairro. Sua participação é voluntária e se dará por meio de um questionário o qual irá questionar sobre características demográficas e socioeconômicas dos indivíduos; padrão alimentar e de atividade física, distúrbios de composição corporal, consumo de tabaco e bebidas alcoólicas; auto avaliação do estado de saúde, detecção precoce de câncer, questões relacionadas à violência no trânsito. Você não sofrerá nenhum risco, talvez algum desconforto em alguma resposta.  Conhecer a situação de saúde da população é o primeiro passo para planejar ações e programas que reduzam a ocorrência e a gravidade destas doenças, melhorando assim a situação de saúde no município, assim, justificamos este estudo. Se depois de consentir, o Sr (a) desistir de continuar participando, terá todo direito e a liberdade de retirar seu consentimento em qualquer fase da pesquisa, seja antes ou depois da coleta dos dados, independente do motivo e sem nenhum prejuízo a sua pessoa. O Sr (a) não terá nenhuma despesa e não receberá nenhuma remuneração. Os resultados da pesquisa serão analisados e publicados, mas sua identidade não será divulgada, sendo guardado em sigilo. Para qualquer outra informação, o (a) Sr (a) poderá entrar em contato com os pesquisadores, pelo telefone 3645-5573, ou poderá entrar em contato com o Comitê de Ética em Pesquisa – CEP/UnC, na Av. Presidente Nereu Ramos, 1071, Jardim do Moinho, Mafra-SC, telefone (47) 3641-5500 e/ou e-mail comitedeetica@unc.br .',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color.fromARGB(255,16,29,50)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container (
                              margin: EdgeInsets.only(left: 50),
                              child: CheckboxListTile(
                                title: Text(
                                  "Li e concordo com os Termos de Serviço",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255,16,29,50)
                                  ),
                                ),
                                subtitle: Text(
                                  "É necessário aceitar para continuar",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255,100,100,100)
                                  ),
                                ),
                                checkColor: Color.fromARGB(255,255,255,255),
                                activeColor: Color.fromARGB(255,16,29,50),
                                value: termsState,
                                
                                onChanged: (newValue) { 
                                  setState(() {
                                    termsState = newValue; 
                                  }); 
                                },
                                controlAffinity: ListTileControlAffinity.leading
                              ),
                            ),
                            Row(
                            // botões
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: FlatButton(
                                    textColor: Color.fromARGB(255,16,29,50),
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                                    shape: RoundedRectangleBorder(side: BorderSide(
                                      color: Color.fromARGB(255,16,29,50),
                                      width: 3,
                                      style: BorderStyle.solid
                                    ), borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/");
                                    },
                                    child: Text(
                                      "Recusar",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500
                                      ),
                                      
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: FlatButton(
                                    color: Color.fromARGB(255,16,29,50),
                                    textColor: Color.fromARGB(255,255,255,255),
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                                    shape: RoundedRectangleBorder(side: BorderSide(
                                      color: Color.fromARGB(255,16,29,50),
                                      width: 3,
                                      style: BorderStyle.solid
                                    ), borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      if(termsState != false){
                                        Navigator.pushNamed(context, "/quiz");
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) => new AlertDialog(
                                            title: Text(
                                              "É necessário aceitar os termos de Serviço para continuar.",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                                color: Color.fromARGB(255,16,29,50)
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.0,
                                                    color: Color.fromARGB(255,16,29,50)
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                            
                                          )
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Aceitar",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                                )
                              ]
                            ),
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
      )
    );
  }
}