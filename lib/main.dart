import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E3C72),
              Color(0xFF2A5298),
              Color(0xFF6B1D9E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // Animated Profile Section
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.scale(
                        scale: value,
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person_outline,
                            size: 90,
                            color: Color(0xFF1E3C72),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Karpagam Shanmugavel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white38,
                            width: 1,
                          ),
                        ),
                        child: const Text(
                          "CSE Student | Flutter Developer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Statistics Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard("Projects", "5+"),
                      _buildStatCard("Experience", "2+"),
                      _buildStatCard("Clients", "10+"),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Education Card
                _buildModernCard(
                  title: "Education",
                  icon: Icons.school_outlined,
                  gradientColors: [Colors.blue.shade400, Colors.purple.shade400],
                  child: Column(
                    children: [
                      _buildInfoTile(
                        icon: Icons.computer_outlined,
                        title: "B.E Computer Science and Engineering",
                        subtitle: "Your Engineering College Name",
                        year: "2022 - 2026",
                      ),
                      _buildInfoTile(
                        icon: Icons.school_outlined,
                        title: "Higher Secondary",
                        subtitle: "Your School Name",
                        year: "2020 - 2022",
                      ),
                    ],
                  ),
                ),
                
                // Skills Card
                _buildModernCard(
                  title: "Technical Skills",
                  icon: Icons.code_outlined,
                  gradientColors: [Colors.green.shade400, Colors.teal.shade400],
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildSkillChip("Flutter", Icons.mobile_friendly),
                      _buildSkillChip("Dart", Icons.code),
                      _buildSkillChip("Python", Icons.code),
                      _buildSkillChip("Java", Icons.coffee),
                      _buildSkillChip("Firebase", Icons.fireplace),
                      _buildSkillChip("UI/UX", Icons.design_services),
                      _buildSkillChip("HTML/CSS", Icons.html),
                      _buildSkillChip("JavaScript", Icons.javascript),
                    ],
                  ),
                ),
                
                // Projects Card
                _buildModernCard(
                  title: "Featured Projects",
                  icon: Icons.rocket_launch_outlined,
                  gradientColors: [Colors.orange.shade400, Colors.red.shade400],
                  child: Column(
                    children: [
                      _buildProjectTile(
                        icon: Icons.person_outline,
                        title: "Modern Portfolio App",
                        subtitle: "Flutter | Material 3",
                        description: "Interactive portfolio with modern UI/UX design and smooth animations",
                        tags: ["Flutter", "Dart", "Material 3"],
                      ),
                      const SizedBox(height: 15),
                      _buildProjectTile(
                        icon: Icons.shopping_cart_outlined,
                        title: "E-Commerce App",
                        subtitle: "Flutter | Firebase",
                        description: "Full-featured shopping application with cart and payment integration",
                        tags: ["Flutter", "Firebase", "Stripe"],
                      ),
                      const SizedBox(height: 15),
                      _buildProjectTile(
                        icon: Icons.chat_bubble_outline,
                        title: "Chat Application",
                        subtitle: "Flutter | Socket.io",
                        description: "Real-time messaging platform with group chat support",
                        tags: ["Socket.io", "Node.js", "MongoDB"],
                      ),
                    ],
                  ),
                ),
                
                // Contact Card
                _buildModernCard(
                  title: "Get in Touch",
                  icon: Icons.contact_mail_outlined,
                  gradientColors: [Colors.pink.shade400, Colors.purple.shade400],
                  child: Column(
                    children: [
                      _buildContactTile(
                        icon: Icons.email_outlined,
                        title: "Email",
                        value: "karpagam.s@example.com",
                        color: Colors.blue,
                      ),
                      _buildContactTile(
                        icon: Icons.phone_outlined,
                        title: "Phone",
                        value: "+91 98765 43210",
                        color: Colors.green,
                      ),
                      _buildContactTile(
                        icon: Icons.location_on_outlined,
                        title: "Location",
                        value: "Chennai, India",
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Social Links
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.work_outline, "https://linkedin.com"),
                      const SizedBox(width: 20),
                      _buildSocialIcon(Icons.code, "https://github.com"),
                      const SizedBox(width: 20),
                      _buildSocialIcon(Icons.camera_alt, "https://instagram.com"),
                      const SizedBox(width: 20),
                      _buildSocialIcon(Icons.alternate_email, "https://twitter.com"),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Download Resume Button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add resume download functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Resume download started...'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1E3C72),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black26,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.download_outlined),
                        SizedBox(width: 10),
                        Text(
                          "Download Resume",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Footer
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    "© 2024 Karpagam Shanmugavel. All rights reserved.",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white38, width: 1),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildModernCard({
    required String title,
    required IconData icon,
    required List<Color> gradientColors,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.95)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String year,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue.shade700, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  year,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSkillChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.purple.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade200, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildProjectTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required List<String> tags,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.blue.shade800, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () {
        // Add navigation to social media URLs
        debugPrint('Opening: $url');
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(icon, color: const Color(0xFF1E3C72), size: 24),
        ),
      ),
    );
  }
}