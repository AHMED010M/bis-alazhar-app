import 'package:flutter/material.dart';
import 'package:bis_alazhar_app/widgets/dynamic_background.dart';
import 'package:bis_alazhar_app/widgets/dashboard_tile.dart';
import 'package:bis_alazhar_app/widgets/app_footer.dart';
import 'package:bis_alazhar_app/screens/study/schedule_screen.dart';
import 'package:bis_alazhar_app/screens/study/subjects_screen.dart';
import 'package:bis_alazhar_app/screens/notes/notes_screen.dart';
import 'package:bis_alazhar_app/screens/forum/forum_screen.dart';
import 'package:bis_alazhar_app/screens/profile/profile_screen.dart';
import 'package:bis_alazhar_app/screens/notifications/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحباً',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'BIS Alazhar',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        icon: const Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const NotificationsScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Dashboard Tiles (2x3 Grid)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Row
                      Row(
                        children: [
                          Expanded(
                            child: DashboardTile(
                              icon: Icons.calendar_today,
                              label: 'الجدول',
                              color: Colors.blue,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const ScheduleScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DashboardTile(
                              icon: Icons.book,
                              label: 'الدراسة',
                              color: Colors.green,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const SubjectsScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Second Row
                      Row(
                        children: [
                          Expanded(
                            child: DashboardTile(
                              icon: Icons.note,
                              label: 'الملازم',
                              color: Colors.orange,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const NotesScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DashboardTile(
                              icon: Icons.forum,
                              label: 'المنتدى',
                              color: Colors.purple,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const ForumScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Third Row
                      Row(
                        children: [
                          Expanded(
                            child: DashboardTile(
                              icon: Icons.person,
                              label: 'الملف الشخصي',
                              color: Colors.teal,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const ProfileScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DashboardTile(
                              icon: Icons.info,
                              label: 'حول التطبيق',
                              color: Colors.indigo,
                              onTap: () {
                                showAboutDialog(
                                  context: context,
                                  applicationName: 'BIS Alazhar',
                                  applicationVersion: '1.0.0',
                                  applicationLegalese: '© 2026 BIS Alazhar',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Footer
              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
