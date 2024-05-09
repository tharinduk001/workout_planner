import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/widgets/exercise_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Date and Time Formatters
  final DateFormat formatter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User Data
  final userData = user;

  //exercise and equipment data
  final exerciseList = ExcerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

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
                userData.fullName,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const ProgressCard(
                progressValue: 0.3,
                total: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Today’s Activity",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Warmups",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: exerciseList),
                        ),
                      );
                    },
                    child: const ExerciseCard(
                      title: "Warmup",
                      imageDescription: "see more...",
                      imageUrl: "assets/images/exercises/downward-facing.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Equipment",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: equipmentList,
                            ),
                          ));
                    },
                    child: const ExerciseCard(
                      title: "Equipment",
                      imageDescription: "see more...",
                      imageUrl: "assets/images/equipments/dumbbells2.png",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Exercise",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: exerciseList,
                            ),
                          ));
                    },
                    child: const ExerciseCard(
                      title: "Exercise",
                      imageDescription: "see more...",
                      imageUrl: "assets/images/exercises/dragging.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Exercise",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: exerciseList,
                            ),
                          ));
                    },
                    child: const ExerciseCard(
                      title: "Stretching",
                      imageDescription: "see more...",
                      imageUrl: "assets/images/exercises/triangle.png",
                    ),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
