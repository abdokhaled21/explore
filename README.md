# Explore - Travel Destination App

A beautiful Flutter app for exploring travel destinations around the world, built with clean architecture and modern UI design.

## Features

- **Grid Layout**: Beautiful 2-column grid display of destination cards
- **Category Filtering**: Filter destinations by Popular, Beach, or Mountains
- **Dynamic Badges**: Category-specific badges with rating percentages
- **Image Error Handling**: Graceful handling of image loading errors
- **Responsive Design**: Clean, modern UI that works on different screen sizes
- **Loading States**: Smooth loading indicators for images

## Project Structure

```
lib/
├── main.dart                 # Main app entry point
├── models/
│   └── destination.dart      # Destination data model
├── data/
│   └── destination_data.dart # Static destination data
└── widgets/
    ├── filter_button.dart    # Category filter button widget
    └── destination_card.dart # Destination card widget
```

## Key Components

### Destination Model
- `name`: Destination name
- `country`: Country location
- `imageUrl`: High-quality image URL from Unsplash
- `rating`: Star rating (1.0 - 5.0)
- `category`: Category classification (Popular, Beach, Mountains)

### Filter System
- **Popular**: Heart icon with pink badge
- **Beach**: Beach umbrella icon with blue badge  
- **Mountains**: Mountain icon with green badge

### Card Features
- **Gradient Overlay**: Dark gradient for text readability
- **Category Badge**: Shows rating percentage with category icon
- **Location Info**: Country with location pin icon
- **Star Rating**: Yellow star with numerical rating
- **Error Handling**: Red error icon for failed image loads

## Design Details

### Colors
- Primary Blue: `#2196F3`
- Mountain Green: `#4CAF50`
- Popular Pink: `#E91E63`
- Text Dark: `#1A1A1A`
- Text Gray: `#666666`
- Background Gray: `#F5F5F5`

### Typography
- Title: 32px, Bold
- Subtitle: 16px, Regular
- Card Title: 18px, Bold
- Card Text: 12px, Regular

### Spacing
- Card spacing: 16px
- Border radius: 16px (cards), 12px (buttons)
- Padding: 16px (screen), 12px (cards)

## Destinations Included

### Popular
- Santorini, Greece
- Kyoto, Japan
- Paris, France
- Bali, Indonesia
- New York, USA
- Machu Picchu, Peru

### Beach
- Maldives
- Maya Bay, Thailand
- Copacabana, Brazil
- Whitehaven, Australia
- Barcelona, Spain
- Santorini, Greece

### Mountains
- Machu Picchu, Peru
- Patagonia, Argentina/Chile
- Swiss Alps, Switzerland
- Banff, Canada
- Himalayas, Nepal

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

## Dependencies

- Flutter SDK: ^3.8.1
- cupertino_icons: ^1.0.8
- flutter_lints: ^5.0.0

## Image Sources

All images are sourced from Unsplash, providing high-quality, free-to-use travel photography.

## Architecture

The app follows clean architecture principles with:
- **Separation of Concerns**: Models, data, and UI widgets are separated
- **Reusable Components**: Widgets are modular and reusable
- **Clean Code**: Well-organized, readable, and maintainable code
- **Error Handling**: Robust error handling for network images

## Future Enhancements

- Search functionality
- Destination details page
- Favorites system
- More categories (Cities, Culture, etc.)
- Offline support
- User reviews and ratings
