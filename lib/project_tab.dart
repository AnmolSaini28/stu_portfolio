// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:stu_portfolio/components/project_card.dart';

class ProjectTab extends StatefulWidget {
  const ProjectTab({super.key});

  @override
  _ProjectTabState createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  final List<Map<String, String>> projects = [
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19-1.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19-2.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19-3.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19.png',
      'grade': 'A',
    },
  ];

  List<Map<String, String>> filteredProjects = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list to show all projects initially
    filteredProjects = projects;
    _searchController.addListener(() {
      filterProjects();
    });
  }

  // Function to filter projects based on search input
  void filterProjects() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProjects = projects.where((project) {
        return project['title']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar implementation
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 16,
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: 'Search a project',
              hintStyle:
                  const TextStyle(color: Color(0xff9E95A2), fontSize: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  gapPadding: 0,
                  borderSide: BorderSide(
                      color: const Color(0xffE0E0E0).withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: const Color(0xffDF5532),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 18,
                    )),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredProjects.length, // Number of items in the list
            itemBuilder: (context, index) {
              final project = filteredProjects[index];
              return ProjectCard(
                title: project['title']!,
                subtitle: project['subtitle']!,
                subsub: project['subsub']!,
                imageUrl: project['imageUrl']!,
                grade: project['grade']!,
              );
            },
          ),
        ),
      ],
    );
  }
}
