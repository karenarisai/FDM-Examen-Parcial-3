import '../models/workout_model.dart';
import '../../../core/database/database_helper.dart';

class LocalWorkoutService {
  final dbHelper = DatabaseHelper.instance; 

  //crear
  Future<int> insertWorkout(WorkoutModel workout) async {
    final db = await dbHelper.database;
    return await db.insert('workouts', workout.toMap());
  }

  //Lectura, se lee como una coleccion de diccionarios
  Future<List<WorkoutModel>> getWorkouts() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('workouts');

    return List.generate(maps.length, (i) {
      return WorkoutModel.fromMap(maps[i]);
    });
  }


  //Eliminacion
  Future<int> deleteWorkout(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'workouts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//Edicion
  Future<int> updateWorkout(WorkoutModel workout) async {
    final db = await dbHelper.database;
    return await db.update(
      'workouts',
      workout.toMap(),
      where: 'id = ?',
      whereArgs: [workout.localId],
    );
  }

}