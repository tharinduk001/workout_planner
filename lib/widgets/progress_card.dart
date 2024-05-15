import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class ProgressCard extends StatefulWidget {
  final double progressValue;
  final int total;

  const ProgressCard(
      {super.key, required this.progressValue, required this.total});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kMainColor, kMainDarkBluekColor])),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Proteins, Fats, Water &\nCarbohydrates",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kMainWhiteColor,
                )),
            const SizedBox(
              height: 30,
            ),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kMainDarkBluekColor,
              valueColor: const AlwaysStoppedAnimation(kMainWhiteColor),
              minHeight: 15,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag("Done", done.toString()),
                _buildTag("Total", widget.total.toString())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kMainWhiteColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "${value} %",
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kMainWhiteColor),
        ),
      ],
    );
  }
}
