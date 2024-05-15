import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/add_equipment_card.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final DateFormat formatter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  final userData = user;
  final exerciseList = ExcerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formatter.format(now);
    String formattedDay = dayFormat.format(now);
    bool state = false;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$formattedDate $formattedDay",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kSubtitleColor),
              ),
              Text(
                "Hello, ${userData.fullName}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lets Add Some Workouts and Equipment for today!",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kMainColor,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "All Exercises",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kMainBlackColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.335,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exerciseList[index];
                      if (userData.exerciseList.contains(exercise)) {
                        state = true;
                      } else {
                        state = false;
                      }
                      return AddExcersiceCard(
                        exerciseTitle: exercise.exerciseName,
                        noOfMinuites: exercise.noOfMinuites,
                        excerciseImageUrl: exercise.exerciseImageUrl,
                        isAdded: state,
                        toggleAddExercise: () {
                          setState(() {
                            if (userData.exerciseList.contains(exercise)) {
                              userData.removeExercise(exercise);
                            } else {
                              userData.addExercise(exercise);
                            }
                          });
                        },
                        isFavourited:
                            userData.favExerciseList.contains(exercise),
                        toggleAddFavourite: () {
                          setState(() {
                            if (userData.favExerciseList.contains(exercise)) {
                              userData.removeExerciseFromFavourits(exercise);
                            } else {
                              userData.addExerciseToFavourits(exercise);
                            }
                          });
                        },
                      );
                    }),
              ),
              const SizedBox(height: 20),
              const Text(
                "All Equipments",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kMainBlackColor,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: equipmentList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        equipmentName: equipment.equipmentName,
                        equipmentDescription: equipment.equipmentDescription,
                        equipmentImageUrl: equipment.equipmentImageUrl,
                        noOfMinuites: equipment.noOfMinuites,
                        noOfCalories: equipment.noOfCalories,
                        isAddEquipment:
                            userData.equipmentList.contains(equipment),
                        toggleAddEquipment: () {
                          setState(() {
                            if (userData.equipmentList.contains(equipment)) {
                              userData.removeEquipment(equipment);
                            } else {
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        isAddFavouriteEquipment:
                            userData.favEquipmentList.contains(equipment),
                        toggleAddFavoriteEquipment: () {
                          setState(() {
                            if (userData.favEquipmentList.contains(equipment)) {
                              userData.removeEquipmentFromFavourits(equipment);
                            } else {
                              userData.addEquipmentToFavourits(equipment);
                            }
                          });
                        },
                      );
                    },
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
