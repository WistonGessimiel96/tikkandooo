import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tikkandoo/utils/app_colors.dart';

import '../../abonnement/list_abonnement.dart';
import '../../historique/historique_ticket.dart';
import '../../horaire/horaire.dart';
import '../../utils/global_vars.dart';
import '../ticket/listticket.dart';
import '../widget/animations/fade_animations.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  dynamic categories = [
    {
      "icon" : "ticket.png",
      "mintitle": "Ticket en cours",
      "page" : TicketDetailPage(ticket: Ticket(
        departure: "Dakar",
        destination: "Colobane",
        departureLocation: "Dakar",
        destinationLocation: "Colobane",
        time: "08:00",
        duration: "5 min",
        price: "200 CFA",
        ticketNo: "TER001",
      ),)
    },
    {
      "icon" : "achat.png",
      "mintitle": "Acheter un ticket",
      "page" : const ListticketPage()
    },
    {
      "icon" : "abonnement.webp",
      "mintitle": "Prendre un abonnement",
      "page" : const ListAbonnementPage()
    },
    {
      "icon" : "horaire.png",
      "mintitle": "Horaire du TR",
      "page" : const HorairePage()
    },
    {
      "icon" : "histo.png",
      "mintitle": "Historique des trajets",
      "page" : const HistoriqueticketPage()
    },
  ];
  final CarouselController _controller = CarouselController();
  int _current = 0;

  Container formatSlider(customHeight) {
    var loadBanner = [];
    if (bannersOnline.isNotEmpty) {
      loadBanner = bannersOnline;
    } else {
      loadBanner.add("tikkando.png");
    }

    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 0.0),
          child: SizedBox.fromSize(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: customHeight / 5.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.87,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() => _current = index);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    items: loadBanner.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () => {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(1.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: bannersOnline.isEmpty
                                      ? Image.asset('lib/assets/img/$image',
                                      width: double.infinity,
                                      height: customHeight / 7,
                                      fit: BoxFit.fill)
                                      : CachedNetworkImage(
                                    imageUrl: "$loadImage$image",
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: loadBanner.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateTo(
                          entry.key / 1.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? Colors.white
                                  : AppColors.secondary)
                                  .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond de la page
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: const Color(0xFF0D4D4D),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top:20.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    const Text("Bonjour,", style: TextStyle(color: Colors.white, fontSize: 20),),
                    const SizedBox(height: 5,),
                    const Text("Wiston Gessimiel,", style: TextStyle(color: AppColors.secondary, fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    const Row(
                      children: [
                        Text("Point de fidélité:", style: TextStyle(color: Colors.white, fontSize: 16),),
                        SizedBox(width: 5,),
                        Text("45", style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 5,),
                    const Row(
                      children: [
                        Text("Abonnement actif:", style: TextStyle(color: Colors.white, fontSize: 16),),
                        SizedBox(width: 5,),
                        Text("trajet par ticket unique", style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.greenAccent
                          ),
                        ),
                        const SizedBox(width: 8,),
                        const Text("Trajet en cours vers Diamniadio", style: TextStyle(color: Colors.greenAccent),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                    delay: 0.2,
                    child: InkWell(
                      child: Card(
                        elevation: 1,
                        color: Colors.lightGreen.shade50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 8, right: 8),
                          child: Column(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.lightGreen.shade50,
                                  BlendMode.saturation,
                                ),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.height / 16,
                                  height:
                                  MediaQuery.of(context).size.height / 16,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'lib/assets/img/${categories[index]['icon']}'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  categories[index]['mintitle'],
                                  style: const TextStyle(fontSize: 9), textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => categories[index]['page'],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Promotions", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),),
          ),
          formatSlider(MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}