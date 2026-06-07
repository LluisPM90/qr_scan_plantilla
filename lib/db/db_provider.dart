import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scan/model/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  // Instància de la base de dades
  static Database? _database;

  // Patró Singleton
  static final DBProvider db = DBProvider._();

  DBProvider._();

  // Retorna la base de dades o la crea si no existeix
  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await initDB();

    return _database!;
  }

    // Retorna tots els registres guardats
  Future<List<ScanModel>> getTotsScans() async {

    final db = await database;

    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromMap(e)).toList()
        : [];
  }

  // Inicialització de la base de dades
  Future<Database> initDB() async {

    // Directori intern de l'aplicació
    final documentsDirectory =
        await getApplicationDocumentsDirectory();

    // Ruta del fitxer SQLite
    final path = join(
      documentsDirectory.path,
      'ScansDB.db',
    );

    // Creació de la base de dades
    return await openDatabase(
      path,
      version: 1,

      onCreate: (Database db, int version) async {

        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipus TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  // Inserta un nou registre a la base de dades
  Future<int> nouScan(ScanModel scan) async {

    final db = await database;

    return await db.insert(
      'Scans',
      scan.toMap(),
    );
  }

    // Elimina tots els registres de la base de dades de les dues llistes
  Future<int> deleteAll() async {

    final db = await database;

    return await db.delete('Scans');
  }
}