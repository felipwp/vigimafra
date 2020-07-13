import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

String filePath;

Future<String> get _externalStoragePath async {
   final directory = await getExternalStorageDirectory();
   print(directory.absolute.path);
   return directory.absolute.path;
 }

Future<File> get _localFile async {
  final path = await _externalStoragePath;
  filePath = '$path/dados.csv';
  return File('$path/dados.csv').create();
}

getCsv() async {
  List<List<dynamic>> rows = List<List<dynamic>>();
  var cloud = await Firestore.instance.collection("questions").getDocuments();

  rows.add([
    "adicionaSal",
    "alimentacaoCarne",
    "alimentacaoDiaFruta",
    "alimentacaoFeijao",
    "alimentacaoFruta",
    "alimentacaoSalada",
    "alimentacaoVerduraLegume",
    "alimentacaoVerduraLegumeCozido",
    "altura",
    "bairro",
    "cigarrosDia",
    "diaAgua",
    "diaLeite",
    "diaRefrigerante",
    "diaSuco",
    "diabetes",
    "diasExercicio",
    "escolaridade",
    "estadoCivil",
    "estadoSaude",
    "etnia",
    "faxinaCasa",
    "frequenciaAlcool",
    "fuma",
    "horasTela",
    "id",
    "idaTrabalho",
    "idade",
    "idadeFumar",
    "lavaFrutaVerdura",
    "peso",
    "pesoIdadeVinteAnos",
    "planoSaude",
    "praticouExercicio",
    "pressaoAlta",
    "sexo",
    "tempoExercicio",
    "tempoIdaTrabalho",
    "tipoExercicio",
    "trabalhoCaminhada",
    "trabalhoPeso"
  ]);
    
  if (cloud.documents.isNotEmpty) {
    cloud.documents.forEach((document) {
      List<dynamic> row = List<dynamic>();
      row.add(document.data["adicionaSal"]);
      row.add(document.data["alimentacaoCarne"]);
      row.add(document.data["alimentacaoDiaFruta"]);
      row.add(document.data["alimentacaoFeijao"]);
      row.add(document.data["alimentacaoFruta"]);
      row.add(document.data["alimentacaoSalada"]);
      row.add(document.data["alimentacaoVerduraLegume"]);
      row.add(document.data["alimentacaoVerduraLegumeCozido"]);
      row.add(document.data["altura"]);
      row.add(document.data["bairro"]);
      row.add(document.data["cigarrosDia"]);
      row.add(document.data["diaAgua"]);
      row.add(document.data["diaLeite"]);
      row.add(document.data["diaRefrigerante"]);
      row.add(document.data["diaSuco"]);
      row.add(document.data["diabetes"]);
      row.add(document.data["diasExercicio"]);
      row.add(document.data["escolaridade"]);
      row.add(document.data["estadoCivil"]);
      row.add(document.data["estadoSaude"]);
      row.add(document.data["etnia"]);
      row.add(document.data["faxinaCasa"]);
      row.add(document.data["frequenciaAlcool"]);
      row.add(document.data["fuma"]);
      row.add(document.data["horasTela"]);
      row.add(document.data["id"]);
      row.add(document.data["idaTrabalho"]);
      row.add(document.data["idade"]);
      row.add(document.data["idadeFumar"]);
      row.add(document.data["lavaFrutaVerdura"]);
      row.add(document.data["peso"]);
      row.add(document.data["pesoIdadeVinteAnos"]);
      row.add(document.data["planoSaude"]);
      row.add(document.data["praticouExercicio"]);
      row.add(document.data["pressaoAlta"]);
      row.add(document.data["sexo"]);
      row.add(document.data["tempoExercicio"]);
      row.add(document.data["tempoIdaTrabalho"]);
      row.add(document.data["tipoExercicio"]);
      row.add(document.data["trabalhoCaminhada"]);
      row.add(document.data["trabalhoPeso"]);
      rows.add(row);
    });

    File f = await _localFile;
      
    String csv = const ListToCsvConverter().convert(rows);
    f.writeAsString(csv);
  }
}