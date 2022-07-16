import 'dart:io';

import 'package:finn/domain/models/word_unit.dart';
import 'package:finn/infrastructure/dtos/word_unit_dto.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WordsLocalSource {
  static const String dbName = 'dict.db';
  Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    final exists = await databaseExists(path);
    if (!exists) {
      // print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      final ByteData data = await rootBundle.load(join('assets/db/', dbName));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return openDatabase(
      join(dbPath, dbName),
    );
  }

  Future<List<WordUnitDTO>> query(
      String search, String language, String translation) async {
    // print("from repo translation:  ${translation} \n language:  ${language}");
    final db = await _init();
    final List<Map> data = await db
        .rawQuery("SELECT * FROM data WHERE $language LIKE '%$search%'");

    final words = data.map((word) {
      return WordUnitDTO.fromDb(word as Map<String, dynamic>, translation);
    }).toList();

    return words;
  }
}
