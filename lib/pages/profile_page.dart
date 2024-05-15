import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/profile_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Date and Time Formatters
  final DateFormat formatter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  //User Data
  final userData = user;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formatter.format(now);
    String formattedDay = dayFormat.format(now);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "$formattedDate $formattedDay",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kSubtitleColor),
              ),
              Text(
                userData.fullName,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor),
              ),
              const SizedBox(
                height: 20,
              ),
              ProgressCard(
                progressValue: userData.calculateTotalCaloriesBurned(),
                total: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kCardBgColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 1.5,
                        horizontal: kDefaultPadding * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minuites Spend : ${userData.calculateTotalMinuitesSpend().toString()}",
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: kMainDarkBluekColor),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Total Exercises Completed : ${userData.totalExercisesCompleted}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kMainBlackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total Equipments Handovered : ${userData.totalEquipmentHandedOver}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kMainBlackColor),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Exercises",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kMainDarkBluekColor),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: userData.exerciseList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Exercise userExercise = userData.exerciseList[index];
                  return ProfileCard(
                    taskName: userExercise.exerciseName,
                    taskImageUrl: userExercise.exerciseImageUrl,
                    markAsDone: () {
                      setState(() {
                        userData.markExerciseAsCompleted(userExercise.id);
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Equipments",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kMainDarkBluekColor),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: userData.equipmentList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Equipment userEquipment = userData.equipmentList[index];
                  return ProfileCard(
                    taskName: userEquipment.equipmentName,
                    taskImageUrl: userEquipment.equipmentImageUrl,
                    markAsDone: () {
                      setState(() {
                        userData.markEquipmentAsHandedOver(userEquipment.id);
                      });
                    },
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
