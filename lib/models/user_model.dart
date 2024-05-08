import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String address;
  final String description;
  int totalExercisesCompleted = 0;
  int totalEquipmentHandedOver = 0;

  final List<Exercise> exerciseList;
  final List<Exercise> favExerciseList;
  final List<Equipment> equipmentList;
  final List<Equipment> favEquipmentList;

  User(
      {required this.userId,
      required this.fullName,
      required this.age,
      required this.gender,
      required this.address,
      required this.description,
      required this.exerciseList,
      required this.favExerciseList,
      required this.equipmentList,
      required this.favEquipmentList,
      required int totalEquipmentHandedOver,
      required int totalExercisesCompleted});
}
