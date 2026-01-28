import 'package:flutter/material.dart';

class BottomBarListPage extends StatefulWidget {
  const BottomBarListPage({super.key});

  @override
  State<BottomBarListPage> createState() => _BottomBarListPageState();
}

class _BottomBarListPageState extends State<BottomBarListPage> {
  int _currentIndex = 0;

  final List<List<String>> _lists = [
    List.generate(20, (i) => "Home item ${i + 1}"),
    List.generate(15, (i) => "Search result ${i + 1}"),
    List.generate(10, (i) => "Profile option ${i + 1}"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
      ),

      body: ListView.builder(
        itemCount: _lists[_currentIndex].length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(_getIcon()),
            title: Text(_lists[_currentIndex][index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _lists[_currentIndex][index],
                  ),
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return "Home";
      case 1:
        return "Search";
      case 2:
        return "Profile";
      default:
        return "";
    }
  }

  IconData _getIcon() {
    switch (_currentIndex) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.search;
      case 2:
        return Icons.person;
      default:
        return Icons.list;
    }
  }
}
