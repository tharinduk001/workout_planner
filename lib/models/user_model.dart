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

//Add exercises to the list
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

//Remove exercise from the list
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  void addExerciseToFavourits(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  void removeExerciseFromFavourits(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

//add equipment to list
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

//remove equipment to list
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  //add equipment to favourite list
  void addEquipmentToFavourits(Equipment equipment) {
    favEquipmentList.add(equipment);
  }

  //remove equipment from favourite list
  void removeEquipmentFromFavourits(Equipment equipment) {
    favEquipmentList.remove(equipment);
  }

  //method to calculate the total minutes spend
  int calculateTotalMinuitesSpend() {
    int totalMinuitesSpend = 0;

    for (var exercise in exerciseList) {
      totalMinuitesSpend += exercise.noOfMinuites;
    }

    for (var equipment in equipmentList) {
      totalMinuitesSpend += equipment.noOfMinuites;
    }

    return totalMinuitesSpend;
  }

  void markExerciseAsCompleted(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);

    exercise.completed = true;

    removeExercise(exercise);

    totalExercisesCompleted++;
  }

  void markEquipmentAsHandedOver(int equipmentId) {
    final equipment = equipmentList
        .firstWhere((singleEquipment) => singleEquipment.id == equipmentId);

    equipment.handOvered = true;

    removeEquipment(equipment);

    totalEquipmentHandedOver++;
  }

  double calculateTotalCaloriesBurned() {
    double totalCaloriesBurned = 0.0;

    for (var equipment in equipmentList) {
      totalCaloriesBurned += equipment.noOfCalories;
    }

    if (totalCaloriesBurned > 0 && totalCaloriesBurned <= 10) {
      totalCaloriesBurned = totalCaloriesBurned / 10;
    }
    if (totalCaloriesBurned > 10 && totalCaloriesBurned <= 100) {
      totalCaloriesBurned = totalCaloriesBurned / 100;
    }
    if (totalCaloriesBurned > 100 && totalCaloriesBurned <= 1000) {
      totalCaloriesBurned = totalCaloriesBurned / 1000;
    }

    return totalCaloriesBurned;
  }
}
