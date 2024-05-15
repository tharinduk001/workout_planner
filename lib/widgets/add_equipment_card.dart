import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinuites;
  final double noOfCalories;
  final void Function() toggleAddEquipment;
  final bool isAddEquipment;
  final void Function() toggleAddFavoriteEquipment;
  final bool isAddFavouriteEquipment;

  const AddEquipmentCard(
      {super.key,
      required this.equipmentName,
      required this.equipmentImageUrl,
      required this.noOfMinuites,
      required this.noOfCalories,
      required this.equipmentDescription,
      required this.toggleAddEquipment,
      required this.isAddEquipment,
      required this.toggleAddFavoriteEquipment,
      required this.isAddFavouriteEquipment});

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: kCardBgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding, horizontal: kDefaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.equipmentName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.equipmentImageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    children: [
                      Text(
  
                        widget.equipmentDescription,
                        style: const TextStyle(
                            color: kSubPinkColor,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Time: ${widget.noOfMinuites} minutes and ${widget.noOfCalories} calories burned.",
                        style: const TextStyle(
                            color: kMainDarkBluekColor,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 201, 198, 198)
                            .withOpacity(0.6)),
                    child: Center(
                      child: IconButton(
                          onPressed: widget.toggleAddEquipment,
                          icon: Icon(
                            widget.isAddEquipment ? Icons.remove : Icons.add,
                            size: 30,
                            color: Color.fromARGB(255, 3, 116, 209),
                          )),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 201, 198, 198)
                            .withOpacity(0.6)),
                    child: Center(
                      child: IconButton(
                          onPressed: widget.toggleAddFavoriteEquipment,
                          icon: Icon(
                            widget.isAddFavouriteEquipment
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 30,
                            color: kMainPinkColor,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
