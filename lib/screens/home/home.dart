import 'package:mypsy_app/screens/layouts/page_layout.dart';
import 'package:flutter/material.dart';
import 'package:mypsy_app/shared/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => LayoutPage(
        title: 'Home',
        child: Column(
          children: [
            for (var i = 0; i < doctors.length; i++)
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.doctorInfo);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(doctors[i]['image']),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctors[i]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              doctors[i]['specialty'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            doctors[i]['rating'].toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      );
}

final List<Map<String, dynamic>> doctors = const [
  {
    "name": "Dr.Anis XXX",
    "specialty": "Physiotherapist",
    "adresse": "Sousse, Khzema",
    "rating": 4.9,
    "image": "https://randomuser.me/api/portraits/women/1.jpg"
  },
  {
    "name": "Dr.Mouna XXX",
    "specialty": "Physiotherapist",
    "adresse": "Sousse, Khzema",
    "rating": 4.5,
    "image": "https://randomuser.me/api/portraits/men/2.jpg"
  },
  {
    "name": "Dr.Amine",
    "specialty": "Physiotherapist",
    "adresse": "Sousse, Khzema",
    "rating": 4.5,
    "image": "https://randomuser.me/api/portraits/women/4.jpg"
  },
  {
    "name": "Dr.Mohamed",
    "specialty": "Physiotherapist",
    "adresse": "Sousse, Khzema",
    "rating": 4.5,
    "image": "https://randomuser.me/api/portraits/women/5.jpg"
  },
];
