import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: const Color(0xFF2C3E50),
      child: Column(
        children: [
          // Menu Header
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFF34495E),
            child: const Row(
              children: [
                Icon(Icons.menu, color: Colors.white),
                SizedBox(width: 16),
                Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Menu Items
          _buildMenuItem('History', Icons.history),
          _buildMenuItem('Uploaded Files', Icons.upload_file),
          _buildMenuItem('Captured Files', Icons.folder),
          _buildMenuItem('Saved Transcripts', Icons.description),
          
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(icon, color: Colors.white70, size: 20),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 