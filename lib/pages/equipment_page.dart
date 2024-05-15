import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/widgets/equipment_card.dart';

class EquipmentDetailsPage extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentDescription;
  final List<Equipment> equipmentList;

  const EquipmentDetailsPage(
      {super.key,
      required this.equipmentTitle,
      required this.equipmentDescription,
      required this.equipmentList});

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
  //Date and Time Formatters
  final DateFormat formatter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formatter.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
        appBar: AppBar(
          title: Column(
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
                widget.equipmentTitle,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Text(
                  widget.equipmentDescription,
                  style: const TextStyle(
                      fontSize: 14,
                      color: kSubtitleColor,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 3 / 2.25),
                  itemCount: widget.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment equipment = widget.equipmentList[index];
                    return EquipmentCard(
                        equipmentName: equipment.equipmentName,
                        equipmentDescription: equipment.equipmentDescription,
                        equipmentImageUrl: equipment.equipmentImageUrl,
                        noOfMinuites: equipment.noOfMinuites,
                        noOfCalories: equipment.noOfCalories);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
