import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddExcersiceCard extends StatefulWidget {
  final String exerciseTitle;
  final String excerciseImageUrl;
  final int noOfMinuites;
  final bool isAdded;
  final bool isFavourited;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavourite;

  const AddExcersiceCard(
      {super.key,
      required this.exerciseTitle,
      required this.noOfMinuites,
      required this.excerciseImageUrl,
      required this.toggleAddExercise,
      required this.isAdded,
      required this.toggleAddFavourite,
      required this.isFavourited});

  @override
  State<AddExcersiceCard> createState() => _AddExcersiceCardState();
}

class _AddExcersiceCardState extends State<AddExcersiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 13),
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kCardBgColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.exerciseTitle,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                widget.excerciseImageUrl,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.noOfMinuites} minuites",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
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
                            onPressed: widget.toggleAddExercise,
                            icon: Icon(
                              widget.isAdded ? Icons.remove : Icons.add,
                              size: 30,
                              color: const Color.fromARGB(255, 3, 116, 209),
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
                            onPressed: widget.toggleAddFavourite,
                            icon: Icon(
                              widget.isFavourited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: kMainPinkColor,
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
