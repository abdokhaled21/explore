import 'package:flutter/material.dart';
import '../models/destination.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final String selectedCategory;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(child: _buildImage()),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.2),
                      Colors.black.withValues(alpha: 0.4),
                      Colors.black.withValues(alpha: 0.6),
                      Colors.black.withValues(alpha: 0.8),
                    ],
                    stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(top: 12, right: 12, child: _buildBadge()),
            Positioned(bottom: 12, left: 12, right: 12, child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: destination.imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: const Color(0xFFF5F5F5),
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        color: const Color(0xFFF5F5F5),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 32),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge() {
    IconData badgeIcon;
    Color iconColor;

    switch (selectedCategory) {
      case 'Beach':
        badgeIcon = Icons.beach_access;
        iconColor = const Color(0xFF2196F3);
        break;
      case 'Mountains':
        badgeIcon = Icons.landscape;
        iconColor = const Color(0xFF4CAF50);
        break;
      case 'Cities':
        badgeIcon = Icons.location_city;
        iconColor = const Color(0xFFFFD700);
        break;
      case 'Cultural':
        badgeIcon = Icons.temple_buddhist_outlined;
        iconColor = const Color(0xFF9C27B0);
        break;
      default:
        badgeIcon = Icons.favorite;
        iconColor = const Color(0xFFE91E63);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badgeIcon, color: iconColor, size: 12),
          const SizedBox(width: 4),
          Text(
            '${(destination.rating * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          destination.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white, size: 14),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                destination.country,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFFD700), size: 14),
            const SizedBox(width: 4),
            Text(
              destination.rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
