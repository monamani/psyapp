import 'package:flutter/material.dart';
import 'package:mypsy_app/shared/routes.dart';
import 'package:mypsy_app/shared/themes/app_colors.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://randomuser.me/api/portraits/women/44.jpg",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Dr. Olfa',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Psychologue',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                        Text('Khzema, Sousse',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Stats
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  InfoStat(
                      icon: Icons.people, label: "5000+", value: "Patients"),
                  InfoStat(
                      icon: Icons.work,
                      label: "10+",
                      value: "d'experiences..."),
                  InfoStat(icon: Icons.star, label: "4.8", value: "Rating"),
                  InfoStat(
                      icon: Icons.thumb_up,
                      label: "99%",
                      value: "Recommondation"),
                ],
              ),
              const SizedBox(height: 24),

              // About me
              const Text("A propose de:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                "Elle a reçu plusieurs prix pour sa contribution remarquable au domaine médical."
                "Elle est disponible pour des consultations privées.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text("Lire plus", style: TextStyle(color: Colors.teal)),

              const SizedBox(height: 24),

              // Working Time
              const Text("Horaire",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Lundi - Vendredi, 08:00 AM - 07:00 PM",
                  style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 24),

              // Reviews
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Retouss Patients",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Voir tous", style: TextStyle(color: Colors.teal)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/47.jpg"),
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Maha Mohamed",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          "Dr Olfa est très professionnelle et réactive. J'ai consulté et mon problème est résolu. 😍😍",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.teal, size: 16),
                        SizedBox(width: 4),
                        Text("5",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),

        // Book Appointment Button
        bottomSheet: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.booking);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mypsyPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Prendre rendez-vous",
                style: TextStyle(fontSize: 16, color: AppColors.mypsyWhite)),
          ),
        ),
      );
}

class InfoStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoStat(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: AppColors.mypsySecondary),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
