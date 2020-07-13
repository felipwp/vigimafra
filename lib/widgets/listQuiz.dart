import 'package:vigimafra/models/question.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListQuiz extends StatelessWidget {
  Question question;
  VoidCallback onTapItem;
  ListQuiz({
    @required this.question,
    this.onTapItem,  
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text(
              "Informações coletadas",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Color.fromARGB(255,16,29,50)
              ),
            ),
            content: SingleChildScrollView( // won't be scrollable
              child: Text(
                  'Bairro: "${question.bairro}"\nIdade: ${question.idade} anos\nSexo: ${question.sexo}\nPeso aproximado com 20 anos: ${question.pesoIdadeVinteAnos}kg\nAltura: ${question.altura}m\nEscolaridade completa: ${question.escolaridade}\nQuantos dias na semana come feijão: ${question.alimentacaoFeijao}\nQuantos dias da semana come verdura ou legume: ${question.alimentacaoVerduraLegume}\nQuantos dias da semana come salada: ${question.alimentacaoSalada}\nComo lava as frutas e verduras: ${question.lavaFrutaVerdura}\nQuantos dias da semana come verdura ou legume cozido: ${question.alimentacaoVerduraLegumeCozido}\nQuantos dias da semana costuma come carne: ${question.alimentacaoCarne}\nQuantos dias da semana costuma comer frutas: ${question.alimentacaoFruta}\nQuantas frutas come por dia: ${question.alimentacaoDiaFruta}\nQuantos dias da semana toma refrigerante ou suco artificial: ${question.diaRefrigerante}\nQuantos copos de suco toma por dia: ${question.diaSuco}\nQuantos copos de água toma por dia: ${question.diaAgua}\nQuantos dias da semana toma leite: ${question.diaLeite}\nCom que frequência costuma ingerir bebida alcoólica: ${question.frequenciaAlcool}\nAdiciona sal na comida?: ${question.adicionaSal}\nPraticou algum exercício nos últimos três meses?: ${question.praticouExercicio}\nPrincipal tipo de exercício que praticou: ${question.tipoExercicio}\nQuantos dias por semana pratica exercício?: ${question.diasExercicio}\nQuanto tempo dura seus exercícios: ${question.tempoExercicio}\nAnda bastante apé no seu trabalho?: ${question.trabalhoCaminhada}\nCarrega peso ou faz atividade pesada no trabalho?: ${question.trabalhoPeso}\nCostuma ir apé ao trabalho?: ${question.idaTrabalho}\nTempo gasto para ir e voltar do trabalho: ${question.tempoIdaTrabalho}\nQuem faz faxina na casa: ${question.faxinaCasa}\nQuantas horas por dia utiliza em tempo de tela: ${question.horasTela}\nFuma?: ${question.fuma}\nQuantos cigarros fuma por dia: ${question.cigarrosDia}\nIdade que começou a fumar: ${question.idadeFumar}\nEstado civil: ${question.estadoCivil}\nEtnia: ${question.etnia}\nClassifica o estado de saúde como: ${question.estadoSaude}\nPossui plano de saúde ou convênio?: ${question.planoSaude}\nAlgum médico já lhe disse que tem pressão alta?: ${question.pressaoAlta}\nAlgum médico já lhe disse que tem diabetes?: ${question.diabetes}',
                  style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color.fromARGB(255,16,29,50)
                ),
              ),
              
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'FECHAR',
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
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromARGB(255,16,29,50),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(right: 15),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person,
                          color: Color.fromARGB(255,255,185,0)
                        )
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bairro: "${question.bairro}"',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255,16,29,50),
                          ),
                        ),
                        Text(
                          '${question.sexo}, ${question.idade} anos',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255,16,29,50),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],            
        ),
      ), 
    );
  }
}