class ServiceData {
  final String name;
  final String description;
  final String imagePath;

  ServiceData({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  final List<ServiceData> services = [
    ServiceData(
        name: 'Service 1',
        description: 'Description 1',
        imagePath: 'image1.png'),
    ServiceData(
        name: 'Service 2',
        description: 'Description 2',
        imagePath: 'image2.png'),
    ServiceData(
        name: 'Service 3',
        description: 'Description 3',
        imagePath: 'image3.png'),
    ServiceData(
        name: 'Service 4',
        description: 'Description 4',
        imagePath: 'image4.png'),
    ServiceData(
        name: 'Service 5',
        description: 'Description 5',
        imagePath: 'image5.png'),
 
  ];
}
