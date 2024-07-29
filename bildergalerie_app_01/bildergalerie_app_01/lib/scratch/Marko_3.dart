                                                                                                                                                                             
11:38 Uhr
import 'package:mygalerieapp/src/feauture/todos/card_widget.dart';
import 'package:mygalerieapp/src/feauture/todos/domain/item_list.dart';
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          final newsItem = item[index];
          return NewsItem(
            newsTitle: newsItem.newsTitle,
            imageURL: newsItem.imageURL,
            data: newsItem.data,
            description: newsItem.description,
          );
        },
      ),
    );
  }
}
11:40 Uhr
class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.newsTitle,
    required this.imageURL,
    required this.data,
    required this.description,
  });
  final String newsTitle;
  final String imageURL;
  final String data;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: {
            'title': newsTitle,
            'imageURL': imageURL,
            'date': data,
            'description': description,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  imageURL,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  newsTitle,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
11:40 Uhr
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(
            54, 57, 59, 1), // Background color deteils screen
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              arguments['imageURL'],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    arguments['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    arguments['date'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: Text(
                      arguments['description'],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
11:40 Uhr
class News {
  News({
    required this.newsTitle,
    required this.imageURL,
    required this.data,
    required this.description,
  });
  final String newsTitle;
  final String imageURL;
  final String data;
  final String description;
}