import 'package:flutter/material.dart';
import 'package:vigimafra/models/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  
  
  // instanciando o questionario
  Question question; 
  final formKey = GlobalKey<FormState>();
  TextEditingController bairroController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoIdadeVinteAnosController = TextEditingController();
  TextEditingController idadeFumarController = TextEditingController();
  List<String> sexo = ['Masculino', 'Feminino']; 
  String sexoSelecionado;
  List<String> escolaridade = ['Curso primário', 'Curso ginasial ou ginásio', '1º grau ou fundamental', '2º grau ou colégio ou ensino médio', '3º grau ou curso superior', 'Pós-graduação', 'Nunca estudou', 'Não quis responder']; 
  String escolaridadeSelecionada;
  List<String> alimentacaoFeijao = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String alimentacaoFeijaoSelecionado;
  List<String> alimentacaoVerduraLegume = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String alimentacaoVerduraLegumeSelecionado;
  List<String> alimentacaoSalada = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String alimentacaoSaladaSelecionado;
  List<String> alimentacaoVerduraLegumeCozido = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String alimentacaoVerduraLegumeCozidoSelecionado;
  List<String> lavaFrutaVerdura = ['Somente água', 'Água e sabão/detergente','Água e vinagre', 'Não lava']; 
  String lavaFrutaVerduraSelecionado;
  List<String> alimentacaoCarne = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String alimentacaoCarneSelecionado;
  List<String> alimentacaoFruta = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String alimentacaoFrutaSelecionado;
  List<String> alimentacaoDiaFruta = ['1 vez no dia', '2 vezes no dia', '3 ou mais vezes no dia']; 
  String alimentacaoDiaFrutaSelecionado;
  List<String> diaRefrigerante = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String diaRefrigeranteSelecionado;
  List<String> diaSuco = ['1', '2', '3', '4', '5', '6 ou mais', 'Não sabe']; 
  String diaSucoSelecionado;
  List<String> diaAgua = ['1', '2', '3', '4', '5', '6 ou mais', 'Não sabe']; 
  String diaAguaSelecionado;
  List<String> diaLeite = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca']; 
  String diaLeiteSelecionado;
  List<String> frequenciaAlcool = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Menos de 1 dia por semana', 'Menos de 1 dia por mês', 'Nunca']; 
  String frequenciaAlcoolSelecionado;
  List<String> adicionaSal = ['Não', 'Sim, sempre ou quase sempre', 'Sim, de vez enquando']; 
  String adicionaSalSelecionado;
  List<String> praticouExercicio = ['Sim', 'Não']; 
  String praticouExercicioSelecionado;
  List<String> tipoExercicio = ['Caminhada', 'Caminhada em esteira', 'Corrida', 'Corrida em esteira', 'Musculação', 'Ginástica laboral', 'Hidroginástica', 'Ginástica em geral', 'Natação', 'Artes marciais e luta', 'Bicicleta', 'Futebol', 'Basquetebol', 'Voleibol', 'Tênis', 'Outros']; 
  String tipoExercicioSelecionado;
  List<String> diasExercicio = ['1 a 2 dias por semana', '3 a 4 dias por semana', '5 a 6 dias por semana', 'Todos os dias', 'Quase nunca', 'Nunca'];  
  String diasExercicioSelecionado;
  List<String> tempoExercicio = ['Não pratica', 'Menos que 10 minutos', 'Entre 10 e 19 minutos', 'Entre 20 e 29 minutos', 'Entre 30 e 44 minutos', 'Entre 45 e 59 minutos', '60 minutos ou mais'];  
  String tempoExercicioSelecionado;
  List<String> trabalhoCaminhada = ['Sim', 'Não', 'Não sabe', 'Não trabalha'];  
  String trabalhoCaminhadaSelecionado;
  List<String> trabalhoPeso = ['Sim', 'Não', 'Não sabe', 'Não trabalha'];  
  String trabalhoPesoSelecionado;
  List<String> idaTrabalho = ['Sim', 'Não', 'Não trabalha'];  
  String idaTrabalhoSelecionado;
  List<String> tempoIdaTrabalho = ['Não trabalha', 'Menos que 20 minutos', 'Entre 20 e 29 minutos', '30 minutos ou mais'];  
  String tempoIdaTrabalhoSelecionado;
  List<String> faxinaCasa = ['Eu sozinho', 'Eu com outra pessoa', 'Outra pessoa'];  
  String faxinaCasaSelecionado;
  List<String> horasTela = ['Menos de 1 hora', 'Entre 1 e 2 horas', 'Entre 2 e 3 horas', 'Entre 3 e 4 horas', 'Entre 4 e 5 horas', 'Entre 5 e 6 horas', 'Mais de 6 horas'];  
  String horasTelaSelecionado;
  List<String> fuma = ['Sim, diariamente', 'Sim, ocasionalmente', 'Não'];  
  String fumaSelecionado;
  List<String> cigarrosDia = ['Não fuma', '1 a 4', '5 a 9', '10 a 14', '15 a 19', '20 a 29', '30 a 39', '40 ou mais'];  
  String cigarrosDiaSelecionado;
  List<String> estadoCivil = ['Solteiro', 'Casado/Juntado', 'Viúvo', 'Separado/Divorciado'];  
  String estadoCivilSelecionado;
  List<String> etnia = ['Sulamericano', 'Africano', 'Indígena','Asiático', 'Europeia', 'Norte americana', 'Não sabe'];  
  String etniaSelecionado;
  List<String> estadoSaude = ['Muito bom', 'Bom', 'Regular', 'Ruim','Muito Ruim','Não sabe', 'Não quis informar'];  
  String estadoSaudeSelecionado;
  List<String> planoSaude = ['Sim', 'Não'];  
  String planoSaudeSelecionado;
  List<String> pressaoAlta = ['Sim', 'Não', 'Não lembra']; 
  String pressaoAltaSelecionado;
  List<String> diabetes = ['Sim', 'Não', 'Não lembra']; 
  String diabetesSelecionado;
  
  saveQuiz() async {
    question.bairro = bairroController.text;
    question.idade = int.parse(idadeController.text);
    question.peso = double.parse(pesoController.text);
    question.altura = double.parse(alturaController.text);
    question.pesoIdadeVinteAnos = double.parse(pesoIdadeVinteAnosController.text);
    question.idadeFumar = int.parse(idadeFumarController.text);
    question.sexo = sexoSelecionado;
    question.escolaridade = escolaridadeSelecionada;
    question.alimentacaoFeijao = alimentacaoFeijaoSelecionado;
    question.alimentacaoVerduraLegume = alimentacaoVerduraLegumeSelecionado;
    question.alimentacaoSalada = alimentacaoSaladaSelecionado;
    question.alimentacaoVerduraLegumeCozido = alimentacaoVerduraLegumeCozidoSelecionado;
    question.lavaFrutaVerdura = lavaFrutaVerduraSelecionado;
    question.alimentacaoCarne = alimentacaoCarneSelecionado;
    question.alimentacaoFruta = alimentacaoFrutaSelecionado;
    question.alimentacaoDiaFruta = alimentacaoDiaFrutaSelecionado;
    question.diaRefrigerante = diaRefrigeranteSelecionado;
    question.diaSuco = diaSucoSelecionado;
    question.diaAgua = diaAguaSelecionado;
    question.diaLeite = diaLeiteSelecionado;
    question.frequenciaAlcool = frequenciaAlcoolSelecionado;
    question.adicionaSal = adicionaSalSelecionado;
    question.praticouExercicio = praticouExercicioSelecionado;
    question.tipoExercicio = tipoExercicioSelecionado;
    question.diasExercicio = diasExercicioSelecionado;
    question.tempoExercicio = tempoExercicioSelecionado;
    question.trabalhoCaminhada = trabalhoCaminhadaSelecionado;
    question.trabalhoPeso= trabalhoPesoSelecionado;
    question.idaTrabalho = idaTrabalhoSelecionado;
    question.tempoIdaTrabalho = tempoIdaTrabalhoSelecionado;
    question.faxinaCasa = faxinaCasaSelecionado;
    question.horasTela = horasTelaSelecionado;
    question.fuma = fumaSelecionado;
    question.cigarrosDia = cigarrosDiaSelecionado;
    question.estadoCivil = estadoCivilSelecionado;
    question.etnia = etniaSelecionado;
    question.estadoSaude = estadoSaudeSelecionado;
    question.planoSaude = planoSaudeSelecionado;
    question.pressaoAlta = pressaoAltaSelecionado;
    question.diabetes = diabetesSelecionado;

    Firestore db = Firestore.instance;
    db.collection("questions").document(
      question.id).setData(
        question.toMap() 
      ).then((_){
      Navigator.pushReplacementNamed(context, "/");
    });

  }

  @override
  //gerando id do questionario
  void initState() {
    super.initState();
    question = Question.gerarID();
  } 
 

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
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child:Container(
                      margin: EdgeInsets.only(top: 30, left: 30),
                     
                      child: Text( 
                        'Questionário',
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
                  )
                ),
                Container(
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
                        width: 1000.0,
                        margin: EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 50), 
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Irei te fazer algumas perguntas que são importantes para verificarmos como estão os hábitos de saúde do povo mafrense.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.0,
                                    color: Color.fromARGB(255,16,29,50)
                                  ),
                                ),
                              ),

                              Form (
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 25),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'INFORMAÇÕES GERAIS.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                            color: Color.fromARGB(255,16,29,50)
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Bairro',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextField(
                                                controller: bairroController,
                                                keyboardType: TextInputType.text,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Digite o bairro...",
                                                  filled: false,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),

                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Idade',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextField(
                                                controller: idadeController,
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Digite a sua idade...",
                                                  filled: false,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Sexo',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Selecione o sexo',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: sexoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    sexoSelecionado = newValue;
                                                  });
                                                },
                                                items: sexo.map((sexo) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      sexo,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: sexo,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Peso',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextField(
                                                controller: pesoController,
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Digite seu peso...",
                                                  filled: false,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Altura',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextField(
                                                controller: alturaController,
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Digite sua altura...",
                                                  filled: false,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Peso com 20 anos de idade',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextField(
                                                controller: pesoIdadeVinteAnosController,
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Digite o peso com 20 anos...",
                                                  filled: false,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Qual sua escolaridade completa?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a escolaridade',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: escolaridadeSelecionada,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    escolaridadeSelecionada = newValue;
                                                  });
                                                },
                                                items: escolaridade.map((escolaridade) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      escolaridade,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: escolaridade,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'ALIMENTAÇÃO.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                            color: Color.fromARGB(255,16,29,50)
                                          ),
                                        ),
                                      ),
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana o(a) sr(a) costuma comer feijão?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoFeijaoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoFeijaoSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoFeijao.map((alimentacaoFeijao) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoFeijao,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoFeijao,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana, o(a) sr(a) costuma comer pelo menos um tipo de verdura ou legume (alface, tomate, couve, chuchu, berinjela, abobrinha – não vale batata, mandioca ou inhame)?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoVerduraLegumeSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoVerduraLegumeSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoVerduraLegume.map((alimentacaoVerduraLegume) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoVerduraLegume,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoVerduraLegume,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana, o(a) sr(a) costuma comer salada de alface e tomate ou salada de qualquer outra verdura ou legume cru?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoSaladaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoSaladaSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoSalada.map((alimentacaoSalada) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoSalada,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoSalada,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Como você lava as frutas e verduras?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: lavaFrutaVerduraSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    lavaFrutaVerduraSelecionado = newValue;
                                                  });
                                                },
                                                items: lavaFrutaVerdura.map((lavaFrutaVerdura) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      lavaFrutaVerdura,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: lavaFrutaVerdura,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana, o(a) sr(a) costuma comer verdura ou legume cozido junto com a comida ou na sopa, como por exemplo, couve, cenoura, chuchu, berinjela, abobrinha, sem contar batata, mandioca ou inhame?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoVerduraLegumeCozidoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoVerduraLegumeCozidoSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoVerduraLegumeCozido.map((alimentacaoVerduraLegumeCozido) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoVerduraLegumeCozido,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoVerduraLegumeCozido,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana o(a) sr(a) costuma comer carne?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoCarneSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoCarneSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoCarne.map((alimentacaoCarne) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoCarne,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoCarne,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana o(a) sr(a) costuma comer frutas?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoFrutaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoFrutaSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoFruta.map((alimentacaoFruta) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoFruta,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoFruta,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Num dia comum, quantas vezes o(a) sr(a) come frutas?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: alimentacaoDiaFrutaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    alimentacaoDiaFrutaSelecionado = newValue;
                                                  });
                                                },
                                                items: alimentacaoDiaFruta.map((alimentacaoDiaFruta) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      alimentacaoDiaFruta,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: alimentacaoDiaFruta,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana o(a) sr(a) costuma tomar refrigerante (ou suco artificial)?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: diaRefrigeranteSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    diaRefrigeranteSelecionado = newValue;
                                                  });
                                                },
                                                items: diaRefrigerante.map((diaRefrigerante) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      diaRefrigerante,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: diaRefrigerante,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quantos copos/latinhas costuma tomar por dia de SUCO?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: diaSucoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    diaSucoSelecionado = newValue;
                                                  });
                                                },
                                                items: diaSuco.map((diaSuco) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      diaSuco,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: diaSuco,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quantos copos de ÁGUA costuma tomar por dia?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: diaAguaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    diaAguaSelecionado = newValue;
                                                  });
                                                },
                                                items: diaAgua.map((diaAgua) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      diaAgua,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: diaAgua,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Em quantos dias da semana o(a) sr(a) costuma tomar leite? ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: diaLeiteSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    diaLeiteSelecionado = newValue;
                                                  });
                                                },
                                                items: diaLeite.map((diaLeite) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      diaLeite,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: diaLeite,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Com que frequência o(a) sr(a) costuma ingerir alguma bebida alcoólica?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: frequenciaAlcoolSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    frequenciaAlcoolSelecionado = newValue;
                                                  });
                                                },
                                                items: frequenciaAlcool.map((frequenciaAlcool) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      frequenciaAlcool,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: frequenciaAlcool,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'O(a) sr(a) costuma adicionar sal na comida pronta, no seu prato, sem contar a salada?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: adicionaSalSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    adicionaSalSelecionado = newValue;
                                                  });
                                                },
                                                items: adicionaSal.map((adicionaSal) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      adicionaSal,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: adicionaSal,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'ATIVIDADES FÍSICAS.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                            color: Color.fromARGB(255,16,29,50)
                                          ),
                                        ),
                                      ),
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Nos últimos três meses, o(a) sr(a) praticou algum tipo de exercício físico ou esporte?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: praticouExercicioSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    praticouExercicioSelecionado = newValue;
                                                  });
                                                },
                                                items: praticouExercicio.map((praticouExercicio) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      praticouExercicio,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: praticouExercicio,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Qual o tipo principal de exercício físico ou esporte que o(a) sr(a) praticou? ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: tipoExercicioSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    tipoExercicioSelecionado = newValue;
                                                  });
                                                },
                                                items: tipoExercicio.map((tipoExercicio) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      tipoExercicio,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: tipoExercicio,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quantos dias por semana o(a) sr(a) costuma praticar exercício físico ou esporte?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: diasExercicioSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    diasExercicioSelecionado = newValue;
                                                  });
                                                },
                                                items: diasExercicio.map((diasExercicio) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      diasExercicio,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: diasExercicio,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'No dia que o(a) sr(a) pratica exercício ou esporte, quanto tempo dura esta atividade?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: tempoExercicioSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    tempoExercicioSelecionado = newValue;
                                                  });
                                                },
                                                items: tempoExercicio.map((tempoExercicio) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      tempoExercicio,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: tempoExercicio,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'No seu trabalho, o(a) sr(a) anda bastante a pé?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: trabalhoCaminhadaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    trabalhoCaminhadaSelecionado = newValue;
                                                  });
                                                },
                                                items: trabalhoCaminhada.map((trabalhoCaminhada) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      trabalhoCaminhada,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: trabalhoCaminhada,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'No seu trabalho, o(a) sr(a) carrega peso ou faz outra atividade pesada?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: trabalhoPesoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    trabalhoPesoSelecionado = newValue;
                                                  });
                                                },
                                                items: trabalhoPeso.map((trabalhoPeso) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      trabalhoPeso,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: trabalhoPeso,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'O(a) sr(a) costuma ir a pé ou de bicicleta de casa para o trabalho?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: idaTrabalhoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    idaTrabalhoSelecionado = newValue;
                                                  });
                                                },
                                                items: idaTrabalho.map((idaTrabalho) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      idaTrabalho,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: idaTrabalho,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quanto tempo o(a) sr(a) gasta para ir e voltar do trabalho?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: tempoIdaTrabalhoSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    tempoIdaTrabalhoSelecionado = newValue;
                                                  });
                                                },
                                                items: tempoIdaTrabalho.map((tempoIdaTrabalho) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      tempoIdaTrabalho,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: tempoIdaTrabalho,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quem costuma fazer a faxina da sua casa?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: faxinaCasaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    faxinaCasaSelecionado = newValue;
                                                  });
                                                },
                                                items: faxinaCasa.map((faxinaCasa) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      faxinaCasa,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: faxinaCasa,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quantas horas por dia o(a) sr(a) costuma utilizar em tempo de tela (celular, televisão ou computador)?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: horasTelaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    horasTelaSelecionado = newValue;
                                                  });
                                                },
                                                items: horasTela.map((horasTela) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      horasTela,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: horasTela,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'O(a) sr(a) fuma?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: fumaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    fumaSelecionado = newValue;
                                                  });
                                                },
                                                items: fuma.map((fuma) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      fuma,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: fuma,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Quantos cigarros o(a) sr(a) fuma por dia?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: cigarrosDiaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    cigarrosDiaSelecionado = newValue;
                                                  });
                                                },
                                                items: cigarrosDia.map((cigarrosDia) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      cigarrosDia,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: cigarrosDia,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Que idade o(a) sr(a) tinha quando começou a fumar regularmente? ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: TextField(
                                                controller: idadeFumarController,
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Digite a idade em que começou...",
                                                  filled: false,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'FINALIZAÇÃO.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                            color: Color.fromARGB(255,16,29,50)
                                          ),
                                        ),
                                      ),
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Qual seu estado civil atual?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: estadoCivilSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    estadoCivilSelecionado = newValue;
                                                  });
                                                },
                                                items: estadoCivil.map((estadoCivil) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      estadoCivil,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: estadoCivil,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Você é descendente de qual etnia?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: etniaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    etniaSelecionado = newValue;
                                                  });
                                                },
                                                items: etnia.map((etnia) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      etnia,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: etnia,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'SOBRE SEU ESTADO DE SAÚDE.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                            color: Color.fromARGB(255,16,29,50)
                                          ),
                                        ),
                                      ),
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'O(a) sr(a) classificaria seu estado de saúde como:',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: estadoSaudeSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    estadoSaudeSelecionado = newValue;
                                                  });
                                                },
                                                items: estadoSaude.map((estadoSaude) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      estadoSaude,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: estadoSaude,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'O(a) sr(a) tem plano de saúde ou convênio médico? ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: planoSaudeSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    planoSaudeSelecionado = newValue;
                                                  });
                                                },
                                                items: planoSaude.map((planoSaude) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      planoSaude,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: planoSaude,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Algum médico já lhe disse que o(a) sr(a) tem pressão alta?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: pressaoAltaSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    pressaoAltaSelecionado = newValue;
                                                  });
                                                },
                                                items: pressaoAlta.map((pressaoAlta) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      pressaoAlta,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: pressaoAlta,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////////
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Algum médico já lhe disse que o(a) sr(a) tem diabetes?',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 48,
                                          child: Material(
                                            elevation: 5.0,
                                            color: Color.fromARGB(255,255,255,255),
                                            shadowColor: Color.fromARGB(255,16,29,50),
                                            child: Container(
                                              width: 400,
                                              padding: EdgeInsets.only(left: 10),
                                              child: DropdownButton(
                                                hint: Text(
                                                  'Escolha a opção',
                                                    style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0
                                                  ),
                                                ), 
                                                value: diabetesSelecionado,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    diabetesSelecionado = newValue;
                                                  });
                                                },
                                                items: diabetes.map((diabetes) {
                                                  return DropdownMenuItem(
                                                    child: new Text(
                                                      diabetes,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14.0
                                                      ),
                                                    ),
                                                    value: diabetes,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 25, ),
                                        child: FlatButton(
                                          color: Color.fromARGB(255,16,29,50),
                                          textColor: Color.fromARGB(255,255,255,255),
                                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                                          shape: RoundedRectangleBorder(side: BorderSide(
                                            color: Color.fromARGB(255,16,29,50),
                                            width: 3,
                                            style: BorderStyle.solid
                                          ), borderRadius: BorderRadius.circular(50)),
                                          onPressed: () {
                                           if(formKey.currentState.validate()){
                                              formKey.currentState.save();
                                              saveQuiz();
                                            }
                                          },
                                          child: Text(
                                            "Salvar",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      )
                                    ),

                                  ]
                                )
                              ),
                            ]
                          )
                        )
                      ),
                    ],
                  ), 
                ),
              ],
            ),
          )
        )
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color.fromARGB(255,227,172,27),
        foregroundColor: Color.fromARGB(255,29,40,56),
        overlayColor: Color.fromARGB(255,29,40,56),
        overlayOpacity: 0.55,
        curve: Curves.easeInOutBack,
        children: [
          SpeedDialChild( 
            child: Icon(Icons.arrow_back_ios),
            label: "Home",
            backgroundColor: Color.fromARGB(255,227,200,27),
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
            backgroundColor: Color.fromARGB(255,227,200,27),
            foregroundColor: Color.fromARGB(255,29,40,56),
            child: Icon(Icons.dvr),
            label: "Dashboard",
            labelStyle: TextStyle(
              decorationColor: Color.fromARGB(255,29,40,56),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: Color.fromARGB(255,43,43,43)
            ),
            onTap: () => Navigator.pushNamed(context, "/dashboard")
          ),
        ]
      )
    );
  }
}