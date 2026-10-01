import 'package:flutter/material.dart';

void main() {
  runApp(const StudentServicesApp());
}

class StudentServicesApp extends StatelessWidget {
  const StudentServicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mabalacat City College - Student Services System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Dashboard',
    'View Registrar Services',
    'Appointment Schedules',
    'Queue Status',
    'Transaction History',
    'Manage Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Navigation
          Container(
            width: 260,
            color: const Color(0xFF6B1D2F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: Icon(Icons.school, color: Color(0xFF6B1D2F), size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Mabalacat City College',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Registrar's Office",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Student Services System',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white24, height: 1),
                const SizedBox(height: 10),
                
                _buildNavItem(0, Icons.dashboard, 'Dashboard'),
                _buildNavItem(1, Icons.business_center, 'View Registrar Services'),
                _buildNavItem(2, Icons.calendar_today, 'Appointment Schedules'),
                _buildNavItem(3, Icons.format_list_numbered, 'Queue Status'),
                _buildNavItem(4, Icons.history, 'Transaction History'),
                _buildNavItem(5, Icons.person_outline, 'Manage Profile'),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.logout, color: Colors.white70),
                    label: const Text('Logout', style: TextStyle(color: Colors.white70)),
                  ),
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top App Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _titles[_selectedIndex],
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Student Services System Portal",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.notifications_none),
                                onPressed: () {},
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                  child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 10)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xFF6B1D2F),
                                child: Text('JD', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Juan Dela Cruz', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  Text('BSIT - 3rd Year', style: TextStyle(color: Colors.grey, fontSize: 11)),
                                ],
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: Colors.grey),

                // Body content per active module
                Expanded(
                  child: _getSelectedScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        color: isSelected ? const Color(0xFF531221) : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.white70, size: 20),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const DashboardView();
      case 1:
        return const RegistrarServicesView();
      case 2:
        return const AppointmentSchedulesView();
      case 3:
        return const QueueStatusView();
      case 4:
        return const TransactionHistoryView();
      case 5:
        return const ManageProfileView();
      default:
        return const DashboardView();
    }
  }
}

// 01 - Dashboard View
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: _buildStatCard('Upcoming Appointments', '1', Icons.calendar_today, Colors.red.shade50, Colors.red, 'View Schedule ->')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard('Current Queue Status', 'Q015', Icons.people_alt_outlined, Colors.blue.shade50, Colors.blue, 'View Queue ->')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard('Transactions', '3', Icons.receipt_long, Colors.green.shade50, Colors.green, 'View History ->')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard('Available Services', '5', Icons.domain, Colors.purple.shade50, Colors.purple, 'View Services ->')),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Upcoming Appointment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: const [
                                Text('OCT', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                                Text('03', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20)),
                                Text('2026', style: TextStyle(color: Colors.red, fontSize: 10)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Enrollment - Confirmed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                SizedBox(height: 6),
                                Text('09:00 AM - 10:00 AM • Mabalacat City College Registrar Office', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFF6B1D2F), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.account_balance, color: Colors.white, size: 28),
                  SizedBox(height: 12),
                  Text('Need a service?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 6),
                  Text('Browse all available registrar services and start your request.', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color bgColor, Color iconColor, String actionText) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(title, style: TextStyle(color: Colors.grey.shade600, fontSize: 11), overflow: TextOverflow.ellipsis)),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(6)),
                child: Icon(icon, color: iconColor, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          const SizedBox(height: 8),
          Text(actionText, style: TextStyle(color: iconColor, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// 02 - View Registrar Services View
class RegistrarServicesView extends StatelessWidget {
  const RegistrarServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: const [
          ServiceCard(title: 'Certificate Request', category: 'Certificates & Records', duration: '1-3 working days', fee: 'P50.00'),
          ServiceCard(title: 'Transcript of Records', category: 'Academic Records', duration: '3-5 working days', fee: 'P150.00'),
          ServiceCard(title: 'Certificate of Enrollment', category: 'Student Records', duration: 'Same day', fee: 'P50.00'),
          ServiceCard(title: 'Subject Adjustment', category: 'Enrollment', duration: '1-2 working days', fee: 'Free'),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title, category, duration, fee;
  const ServiceCard({super.key, required this.title, required this.category, required this.duration, required this.fee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: const TextStyle(color: Colors.grey, fontSize: 10)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(duration, style: const TextStyle(fontSize: 11, color: Colors.black54)),
              Text(fee, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6B1D2F))),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6B1D2F)),
              onPressed: () {},
              child: const Text('Request', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}

// 03 - Appointment Schedules View
class AppointmentSchedulesView extends StatelessWidget {
  const AppointmentSchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Appointment Schedules', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text('October 2026', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    height: 200,
                    color: Colors.grey.shade50,
                    child: const Center(child: Text('[ Calendar Grid Matrix: Oct 3, 10, 17, 24 Selected Slots ]', style: TextStyle(color: Colors.grey))),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Appointment Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  Text('Enrollment', style: TextStyle(color: Color(0xFF6B1D2F), fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Oct 3, 2026 - 09:00 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 04 - Queue Status View
class QueueStatusView extends StatelessWidget {
  const QueueStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(children: [Text('Your Queue Number', style: TextStyle(color: Colors.grey, fontSize: 12)), SizedBox(height: 8), Text('Q015', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red))]),
                Column(children: [Text('Now Serving', style: TextStyle(color: Colors.grey, fontSize: 12)), SizedBox(height: 8), Text('Q012', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue))]),
                Column(children: [Text('Estimated Waiting Time', style: TextStyle(color: Colors.grey, fontSize: 12)), SizedBox(height: 8), Text('~ 15 mins', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 05 - Transaction History View
class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Transaction History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 16),
            Text('View and track all your registrar transactions.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// 06 - Manage Profile View
class ManageProfileView extends StatelessWidget {
  const ManageProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
            child: Column(
              children: const [
                CircleAvatar(radius: 35, backgroundColor: Color(0xFF6B1D2F), child: Text('JD', style: TextStyle(color: Colors.white, fontSize: 20))),
                SizedBox(height: 12),
                Text('Juan Dela Cruz', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('BSIT - 3rd Year', style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Personal Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  Text('Full Name: Juan Dela Cruz'),
                  Text('Email: juandelacruz@mcc.edu.ph'),
                  Text('Contact: 0912-345-6789'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}