import 'package:flutter/material.dart';
import 'data/destination_data.dart';
import 'widgets/filter_button.dart';
import 'widgets/destination_card.dart';
import 'models/destination.dart';

void main() {
  runApp(const ExploreApp());
}

class ExploreApp extends StatelessWidget {
  const ExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ExploreScreen(),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedCategory = 'Popular';

  final List<String> categories = [
    'Popular',
    'Beach',
    'Mountains',
    'Cities',
    'Cultural',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 8),
              _buildSubtitle(),
              const SizedBox(height: 24),
              _buildFilterButtons(),
              const SizedBox(height: 24),
              Expanded(child: _buildDestinationGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Explore',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.search, color: Color(0xFF666666), size: 24),
        ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Discover dream destinations around the world',
      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
    );
  }

  Widget _buildFilterButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilterButton(
              category: category,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDestinationGrid() {
    final destinations = _getDestinationsForCategory(selectedCategory);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return DestinationCard(
          destination: destinations[index],
          selectedCategory: selectedCategory,
        );
      },
    );
  }

  List<Destination> _getDestinationsForCategory(String category) {
    switch (category) {
      case 'Popular':
        return DestinationData.popularDestinations;
      case 'Beach':
        return DestinationData.beachDestinations;
      case 'Mountains':
        return DestinationData.mountainDestinations;
      case 'Cities':
        return DestinationData.cityDestinations;
      case 'Cultural':
        return DestinationData.culturalDestinations;
      default:
        return DestinationData.popularDestinations;
    }
  }
}
