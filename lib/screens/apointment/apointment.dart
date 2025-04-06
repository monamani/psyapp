import 'package:flutter/material.dart';
import 'package:mypsy_app/shared/routes.dart';
import 'package:mypsy_app/shared/themes/app_colors.dart';
import 'package:mypsy_app/shared/themes/app_theme.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              "Mes rendez-vous",
              style: AppThemes.appbarTitleStyle,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: const TabBar(
              labelColor: AppColors.mypsyDarkBlue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.mypsyDarkBlue,
              tabs: [
                Tab(text: 'À venir'),
                Tab(text: 'Terminé'),
                Tab(text: 'Annulé'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AppointmentList(),
              Center(child: Text('Aucun rendez-vous terminé')),
              Center(child: Text('Aucun rendez-vous annulé')),
            ],
          ),
        ),
      );
}

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = [
      {
        'name': 'Dr. Olfa',
        'type': 'Messages',
        'time': '06:00 PM',
        'image': 'https://randomuser.me/api/portraits/women/44.jpg',
        'icon': Icons.chat,
      },
      {
        'name': 'Dr. Ines',
        'type': 'Appel Audio',
        'time': '04:00 PM',
        'image': 'https://randomuser.me/api/portraits/women/48.jpg',
        'icon': Icons.call,
      },
      {
        'name': 'Dr. Anis',
        'type': 'Appel Video',
        'time': '02:00 PM',
        'image': 'https://randomuser.me/api/portraits/men/47.jpg',
        'icon': Icons.videocam,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        dynamic appointmentInso = appointments[index];
        return AppointmentCard(
          name: appointmentInso['name']!,
          type: appointmentInso['type']!,
          time: appointmentInso['time']!,
          imageUrl: appointmentInso['image']!,
          icon: appointmentInso['icon']! as IconData,
        );
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String name;
  final String type;
  final String time;
  final String imageUrl;
  final IconData icon;

  const AppointmentCard({
    super.key,
    required this.name,
    required this.type,
    required this.time,
    required this.imageUrl,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Top section
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(imageUrl,
                        height: 60, width: 60, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(type,
                                style: const TextStyle(color: Colors.grey)),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.mypsyDarkBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text("À venir",
                                  style: TextStyle(
                                      color: AppColors.mypsyDarkBlue,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(icon, color: AppColors.mypsyDarkBlue, size: 30),
                ],
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text("Aujourd'hui | $time",
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 16),

              // Bottom buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.mypsyDarkBlue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        "Annule\n le rendez-vous",
                        style: TextStyle(
                          color: AppColors.mypsyDarkBlue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.booking);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mypsyDarkBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Reprogrammer",
                      style: TextStyle(color: AppColors.mypsyBgApp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
