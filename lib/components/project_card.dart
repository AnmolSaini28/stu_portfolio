import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subsub;
  final String imageUrl;
  final String grade;

  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subsub,
    required this.imageUrl,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE0E0E0)),
      ),
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            width: 105,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff303030),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subsub,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff9E95A2),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffF39519),
                    Color(0xffFFCD67),
                  ]),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  grade,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
