// service.dart
class Service {
  final String name;
  final String description;
  final String imagePath;

  Service({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

final List<Service> services = [
  Service(
    name: 'Pharmacy Service',
    description: 'Get your medical supplies conveniently from the campus pharmacy.',
    imagePath: 'assets/football.jpg',
  ),
  Service(
    name: 'Printing Service',
    description: 'High-quality printing services for all your document needs.',
    imagePath: 'assets/football.jpg',
  ),
  Service(
    name: 'Drinks Sales',
    description: 'Quench your thirst with our selection of drinks.',
    imagePath: 'assets/football.jpg',
  ),
  Service(
    name: 'Weed Sales',
    description: 'For medical and recreational use, responsibly sourced.',
    imagePath: 'assets/football.jpg',
  ),
  Service(
    name: 'E-Tickets',
    description: 'Book tickets for events and shows on campus.',
    imagePath: 'assets/football.jpg',
  ),
];
