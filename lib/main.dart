import 'package:flutter/material.dart';

void main() {
  runApp(const EcoApp());
}

class EcoApp extends StatelessWidget {
  const EcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Energy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6b9c77)),
        scaffoldBackgroundColor: const Color(0xfff1f6f2),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff2e4735)),
          bodyMedium: TextStyle(color: Color(0xff3d5945)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _lang = 'az';

  final Map<String, Map<String, String>> _t = {
    'az': {
      'title': 'Alternativ Enerji & Fəlakət',
      'welcome': 'Təbiətlə ahəng içində enerji',
      'news': 'Xəbərlər',
      'energy': 'Alternativ Enerji',
      'disaster': 'Fəlakətlərə Hazırlıq',
      'ads': 'Elanlar',
    },
    'en': {
      'title': 'Alternative Energy & Disaster',
      'welcome': 'Energy in harmony with nature',
      'news': 'News',
      'energy': 'Alternative Energy',
      'disaster': 'Disaster Preparedness',
      'ads': 'Announcements',
    },
  };

  String t(String key) => _t[_lang]?[key] ?? key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t('title'), style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff6b9c77),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (value) => setState(() => _lang = value),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'az', child: Text('Azərbaycan')),
              const PopupMenuItem(value: 'en', child: Text('English')),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _headerCard(),
          const SizedBox(height: 20),
          _sectionTitle(t('news')),
          _infoCard(Icons.newspaper, t('news'), 'Yenilənə bilən enerji xəbərləri.'),
          _infoCard(Icons.bolt, t('energy'), 'Külək və günəş layihələri genişlənir.'),
          _infoCard(Icons.warning, t('disaster'), 'Təhlükəsizlik tədbirlərini öyrənin.'),
          _infoCard(Icons.campaign, t('ads'), 'Yeni elanlar əlavə edildi.'),
        ],
      ),
    );
  }

  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff6b9c77),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.eco, color: Colors.white, size: 48),
          const SizedBox(height: 8),
          Text(
            t('welcome'),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff2e4735),
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xffdbe7e0),
          child: Icon(icon, color: const Color(0xff2e4735)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xff6b9c77)),
        onTap: () {},
      ),
    );
  }
}