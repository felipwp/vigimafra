import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  // defindo os atributos do questionario
  String _id;
  String _bairro; // 1 campo
  int _idade; // >= 18 e < 80
  String _sexo; // 2 opções
  String _escolaridade; // 8 opções
  double _peso; // peso ou 2 opções
  double _altura; // altura ou 2 opções
  double _pesoIdadeVinteAnos; // peso nos 20 anos ou 2 opções
  String _alimentacaoFeijao; // 6 opções
  String _alimentacaoVerduraLegume; // 6 opções
  String _alimentacaoSalada; // 6 opções
  String _lavaFrutaVerdura; // 4 opções
  String _alimentacaoVerduraLegumeCozido; // 6 opções
  String _alimentacaoCarne; // 6 opções
  String _alimentacaoFruta; // 6 opções
  String _alimentacaoDiaFruta; // 3 opções
  String _diaRefrigerante; // 6 opções
  String _diaSuco; // 7 opções
  String _diaAgua; // 7 opções
  String _diaLeite; // 6 opções
  String _frequenciaAlcool; // 7 opções
  String _adicionaSal; // 3 opções
  String _praticouExercicio; // 2 opções
  String _tipoExercicio; // 16 opções
  String _diasExercicio; // 5 opções
  String _tempoExercicio; // 6 opções
  String _trabalhoCaminhada; // 4 opções
  String _trabalhoPeso; // 4 opções
  String _idaTrabalho; // 3 opções
  String _tempoIdaTrabalho; // 4 opções
  String _faxinaCasa; // 3 opções
  String _horasTela; // 7 opções
  String _fuma; // 3 opções
  String _cigarrosDia; // 8 opções
  int _idadeFumar; // anos ou 1 opção
  String _estadoCivil; // 4 opções
  String _etnia; // 7 opções
  String _estadoSaude; // 7 opções
  String _planoSaude; // 2 opções
  String _pressaoAlta; // 3 opções
  String _diabetes; // 3 opções 

  // criando o construtor da classe
  Question();

  // construtor para recuperar os questionarios salvos no banco
  Question.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.documentID;
    this.bairro = documentSnapshot["bairro"];
    this.idade = documentSnapshot["idade"];
    this.sexo = documentSnapshot["sexo"];
    this.escolaridade = documentSnapshot["escolaridade"];
    this.peso = documentSnapshot["peso"];
    this.altura = documentSnapshot["altura"];
    this.pesoIdadeVinteAnos = documentSnapshot["pesoIdadeVinteAnos"];
    this.alimentacaoFeijao = documentSnapshot["alimentacaoFeijao"];
    this.alimentacaoVerduraLegume = documentSnapshot["alimentacaoVerduraLegume"];
    this.alimentacaoSalada = documentSnapshot["alimentacaoSalada"];
    this.lavaFrutaVerdura = documentSnapshot["lavaFrutaVerdura"];
    this.alimentacaoVerduraLegumeCozido = documentSnapshot["alimentacaoVerduraLegumeCozido"];
    this.alimentacaoCarne = documentSnapshot["alimentacaoCarne"];
    this.alimentacaoFruta = documentSnapshot["alimentacaoFruta"];
    this.alimentacaoDiaFruta = documentSnapshot["alimentacaoDiaFruta"];
    this.diaRefrigerante = documentSnapshot["diaRefrigerante"];
    this.diaSuco = documentSnapshot["diaSuco"];
    this.diaAgua = documentSnapshot["diaAgua"];
    this.diaLeite = documentSnapshot["diaLeite"];
    this.frequenciaAlcool = documentSnapshot["frequenciaAlcool"];
    this.adicionaSal = documentSnapshot["adicionaSal"];
    this.praticouExercicio = documentSnapshot["praticouExercicio"];
    this.tipoExercicio = documentSnapshot["tipoExercicio"];
    this.diasExercicio = documentSnapshot["diasExercicio"];
    this.tempoExercicio = documentSnapshot["tempoExercicio"];
    this.trabalhoCaminhada = documentSnapshot["trabalhoCaminhada"];
    this.trabalhoPeso = documentSnapshot["trabalhoPeso"];
    this.idaTrabalho = documentSnapshot["idaTrabalho"];
    this.tempoIdaTrabalho = documentSnapshot["tempoIdaTrabalho"];
    this.faxinaCasa = documentSnapshot["faxinaCasa"];
    this.horasTela = documentSnapshot["horasTela"];
    this.fuma = documentSnapshot["fuma"];
    this.cigarrosDia = documentSnapshot["cigarrosDia"];
    this.idadeFumar = documentSnapshot["idadeFumar"];
    this.estadoCivil = documentSnapshot["estadoCivil"];
    this.etnia = documentSnapshot["etnia"];
    this.estadoSaude = documentSnapshot["estadoSaude"];
    this.planoSaude = documentSnapshot["planoSaude"];
    this.pressaoAlta = documentSnapshot["pressaoAlta"];
    this.diabetes = documentSnapshot["diabetes"];
  }

  // construtor para inserir questionarios no banco
  Question.gerarID() {
    Firestore db = Firestore.instance;
    CollectionReference questions = db.collection("questions");
    this.id = questions.document().documentID;
  }

  // criando um mapeamento para a classe
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {
      "id" : this.id,
      "bairro" : this.bairro,
      "idade" : this.idade,
      "sexo" : this.sexo,
      "escolaridade" : this.escolaridade,
      "peso" : this.peso,
      "altura" : this.altura,
      "pesoIdadeVinteAnos" : this.pesoIdadeVinteAnos,
      "alimentacaoFeijao" : this.alimentacaoFeijao,
      "alimentacaoVerduraLegume" : this.alimentacaoVerduraLegume,
      "alimentacaoSalada" : this.alimentacaoSalada,
      "lavaFrutaVerdura" : this.lavaFrutaVerdura,
      "alimentacaoVerduraLegumeCozido" : this.alimentacaoVerduraLegumeCozido,
      "alimentacaoCarne" : this.alimentacaoCarne,
      "alimentacaoFruta" : this.alimentacaoFruta,
      "alimentacaoDiaFruta" : this.alimentacaoDiaFruta,
      "diaRefrigerante" : this.diaRefrigerante,
      "diaSuco" : this.diaSuco,
      "diaAgua" : this.diaAgua,
      "diaLeite" : this.diaLeite,
      "frequenciaAlcool" : this.frequenciaAlcool,
      "adicionaSal" : this.adicionaSal,
      "praticouExercicio" : this.praticouExercicio,
      "tipoExercicio" : this.tipoExercicio,
      "diasExercicio" : this.diasExercicio,
      "tempoExercicio" : this.tempoExercicio,
      "trabalhoCaminhada" : this.trabalhoCaminhada,
      "trabalhoPeso" : this.trabalhoPeso,
      "idaTrabalho" : this.idaTrabalho,
      "tempoIdaTrabalho" : this.tempoIdaTrabalho,
      "faxinaCasa" : this.faxinaCasa,
      "horasTela" : this.horasTela,
      "fuma" : this.fuma,
      "cigarrosDia" : this.cigarrosDia,
      "idadeFumar" : this.idadeFumar,
      "estadoCivil" : this.estadoCivil,
      "etnia" : this.etnia,
      "estadoSaude" : this.estadoSaude,
      "planoSaude" : this.planoSaude,
      "pressaoAlta" : this.pressaoAlta,
      "diabetes" : this.diabetes,
    };
    return map;
}

  // configurando os getters e setters
  // ignore: unnecessary_getters_setters
  String get id => _id;
  // ignore: unnecessary_getters_setters
  set id (String value) {
    _id = value;
  }

  // ignore: unnecessary_getters_setters
  String get bairro => _bairro;
  // ignore: unnecessary_getters_setters
  set bairro (String value) {
    _bairro = value;
  }

  // ignore: unnecessary_getters_setters
  int get idade => _idade;
  // ignore: unnecessary_getters_setters
  set idade (int value) {
    _idade = value;
  }

  // ignore: unnecessary_getters_setters
  String get sexo => _sexo;
  // ignore: unnecessary_getters_setters
  set sexo (String value) {
    _sexo = value;
  }

  // ignore: unnecessary_getters_setters
  String get escolaridade => _escolaridade;
  // ignore: unnecessary_getters_setters
  set escolaridade (String value) {
    _escolaridade = value;
  }

  // ignore: unnecessary_getters_setters
  double get peso => _peso;
  // ignore: unnecessary_getters_setters
  set peso (double value) {
    _peso = value;
  }

  // ignore: unnecessary_getters_setters
  double get altura => _altura;
  // ignore: unnecessary_getters_setters
  set altura (double value) {
    _altura = value;
  }

  // ignore: unnecessary_getters_setters
  double get pesoIdadeVinteAnos => _pesoIdadeVinteAnos;
  // ignore: unnecessary_getters_setters
  set pesoIdadeVinteAnos (double value) {
    _pesoIdadeVinteAnos = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoFeijao => _alimentacaoFeijao;
  // ignore: unnecessary_getters_setters
  set alimentacaoFeijao (String value) {
    _alimentacaoFeijao = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoVerduraLegume => _alimentacaoVerduraLegume;
  // ignore: unnecessary_getters_setters
  set alimentacaoVerduraLegume (String value) {
    _alimentacaoVerduraLegume = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoSalada => _alimentacaoSalada;
  // ignore: unnecessary_getters_setters
  set alimentacaoSalada (String value) {
    _alimentacaoSalada = value;
  }

  // ignore: unnecessary_getters_setters
  String get lavaFrutaVerdura => _lavaFrutaVerdura;
  // ignore: unnecessary_getters_setters
  set lavaFrutaVerdura (String value) {
    _lavaFrutaVerdura = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoVerduraLegumeCozido => _alimentacaoVerduraLegumeCozido;
  // ignore: unnecessary_getters_setters
  set alimentacaoVerduraLegumeCozido (String value) {
    _alimentacaoVerduraLegumeCozido = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoCarne => _alimentacaoCarne;
  // ignore: unnecessary_getters_setters
  set alimentacaoCarne (String value) {
    _alimentacaoCarne = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoFruta => _alimentacaoFruta;
  // ignore: unnecessary_getters_setters
  set alimentacaoFruta (String value) {
    _alimentacaoFruta = value;
  }

  // ignore: unnecessary_getters_setters
  String get alimentacaoDiaFruta => _alimentacaoDiaFruta;
  // ignore: unnecessary_getters_setters
  set alimentacaoDiaFruta (String value) {
    _alimentacaoDiaFruta = value;
  }

  // ignore: unnecessary_getters_setters
  String get diaRefrigerante => _diaRefrigerante;
  // ignore: unnecessary_getters_setters
  set diaRefrigerante (String value) {
    _diaRefrigerante = value;
  }

  // ignore: unnecessary_getters_setters
  String get diaSuco => _diaSuco;
  // ignore: unnecessary_getters_setters
  set diaSuco (String value) {
    _diaSuco = value;
  }

  // ignore: unnecessary_getters_setters
  String get diaAgua => _diaAgua;
  // ignore: unnecessary_getters_setters
  set diaAgua (String value) {
    _diaAgua = value;
  }

  // ignore: unnecessary_getters_setters
  String get diaLeite => _diaLeite;
  // ignore: unnecessary_getters_setters
  set diaLeite (String value) {
    _diaLeite = value;
  }

  // ignore: unnecessary_getters_setters
  String get frequenciaAlcool => _frequenciaAlcool;
  // ignore: unnecessary_getters_setters
  set frequenciaAlcool (String value) {
    _frequenciaAlcool = value;
  }

  // ignore: unnecessary_getters_setters
  String get adicionaSal => _adicionaSal;
  // ignore: unnecessary_getters_setters
  set adicionaSal (String value) {
    _adicionaSal = value;
  }

  // ignore: unnecessary_getters_setters
  String get praticouExercicio => _praticouExercicio;
  // ignore: unnecessary_getters_setters
  set praticouExercicio (String value) {
    _praticouExercicio = value;
  }

  // ignore: unnecessary_getters_setters
  String get tipoExercicio => _tipoExercicio;
  // ignore: unnecessary_getters_setters
  set tipoExercicio (String value) {
    _tipoExercicio = value;
  }

  // ignore: unnecessary_getters_setters
  String get diasExercicio => _diasExercicio;
  // ignore: unnecessary_getters_setters
  set diasExercicio (String value) {
    _diasExercicio = value;
  }

  // ignore: unnecessary_getters_setters
  String get tempoExercicio => _tempoExercicio;
  // ignore: unnecessary_getters_setters
  set tempoExercicio (String value) {
    _tempoExercicio = value;
  }

  // ignore: unnecessary_getters_setters
  String get trabalhoCaminhada => _trabalhoCaminhada;
  // ignore: unnecessary_getters_setters
  set trabalhoCaminhada (String value) {
    _trabalhoCaminhada = value;
  }

  // ignore: unnecessary_getters_setters
  String get trabalhoPeso => _trabalhoPeso;
  // ignore: unnecessary_getters_setters
  set trabalhoPeso (String value) {
    _trabalhoPeso = value;
  }

  // ignore: unnecessary_getters_setters
  String get idaTrabalho => _idaTrabalho;
  // ignore: unnecessary_getters_setters
  set idaTrabalho (String value) {
    _idaTrabalho = value;
  }

  // ignore: unnecessary_getters_setters
  String get tempoIdaTrabalho => _tempoIdaTrabalho;
  // ignore: unnecessary_getters_setters
  set tempoIdaTrabalho (String value) {
    _tempoIdaTrabalho = value;
  }
  
  // ignore: unnecessary_getters_setters
  String get faxinaCasa => _faxinaCasa;
  // ignore: unnecessary_getters_setters
  set faxinaCasa (String value) {
    _faxinaCasa = value;
  }

  // ignore: unnecessary_getters_setters
  String get horasTela => _horasTela;
  // ignore: unnecessary_getters_setters
  set horasTela (String value) {
    _horasTela = value;
  }

  // ignore: unnecessary_getters_setters
  String get fuma => _fuma;
  // ignore: unnecessary_getters_setters
  set fuma (String value) {
    _fuma = value;
  }

  // ignore: unnecessary_getters_setters
  String get cigarrosDia => _cigarrosDia;
  // ignore: unnecessary_getters_setters
  set cigarrosDia (String value) {
    _cigarrosDia = value;
  }

  // ignore: unnecessary_getters_setters
  int get idadeFumar => _idadeFumar;
  // ignore: unnecessary_getters_setters
  set idadeFumar (int value) {
    _idadeFumar = value;
  }

  // ignore: unnecessary_getters_setters
  String get estadoCivil => _estadoCivil;
  // ignore: unnecessary_getters_setters
  set estadoCivil (String value) {
    _estadoCivil = value;
  }

  // ignore: unnecessary_getters_setters
  String get etnia => _etnia;
  // ignore: unnecessary_getters_setters
  set etnia (String value) {
    _etnia = value;
  }

  // ignore: unnecessary_getters_setters
  String get estadoSaude => _estadoSaude;
  // ignore: unnecessary_getters_setters
  set estadoSaude (String value) {
    _estadoSaude = value;
  }

  // ignore: unnecessary_getters_setters
  String get planoSaude => _planoSaude;
  // ignore: unnecessary_getters_setters
  set planoSaude (String value) {
    _planoSaude = value;
  }

  // ignore: unnecessary_getters_setters
  String get pressaoAlta => _pressaoAlta;
  // ignore: unnecessary_getters_setters
  set pressaoAlta (String value) {
    _pressaoAlta = value;
  }

  // ignore: unnecessary_getters_setters
  String get diabetes => _diabetes;
  // ignore: unnecessary_getters_setters
  set diabetes (String value) {
    _diabetes = value;
  }

}

