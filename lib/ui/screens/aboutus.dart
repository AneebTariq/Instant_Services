import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/image/reg.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Welcome to INSTANT SERVICES, your go-to solution for all your home service needs. Whether you need a plumber, electrician, cleaner, or any other home service professional, we have got you covered. With our easy-to-use app, you can find trusted and reliable service providers in your area with just a few taps on your smartphone.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'At ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'INSTANT SERVICES,',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'we understand the importance of having a comfortable and well-maintained home. We also understand that finding reliable and skilled professionals can be a challenging task. That is why we created this app to bridge the gap between homeowners and service providers, making the process quick, convenient, and hassle-free.'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Our mission is to simplify your life by connecting you with qualified professionals who can cater to your home service needs efficiently and affordably. We carefully vet each service provider on our platform, ensuring that they possess the necessary skills, qualifications, and experience to deliver top-notch services. We believe in quality, reliability, and customer satisfaction.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Why choose ISTANT SERVICES APP? Here's what sets us apart:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ruleslist(
              text:
                  '1.  Vast Network of Service Providers: We have an extensive network of service professionals across various categories. From plumbing and electrical work to painting and gardening, you can find the right expert for any job.',
            ),
            ruleslist(
              text:
                  '2.  Verified and Trusted Professionals: We conduct thorough background checks and verification procedures to ensure that all the service providers on our platform are trustworthy and reliable. Your safety and peace of mind are our top priorities.',
            ),
            ruleslist(
              text:
                  '3.  Seamless Booking Process: Our user-friendly app makes it incredibly easy to book a service. Simply enter your location, select the desired service, and choose from the available options. You can even schedule appointments at your convenience.',
            ),
            ruleslist(
              text:
                  '4.  Transparent Pricing: We believe in fair and transparent pricing. You will receive detailed quotes for the services you require, allowing you to compare prices and choose the best option for your budget.',
            ),
            ruleslist(
              text:
                  '5.  Ratings and Reviews: We encourage our users to provide feedback and ratings for the services they receive. This helps maintain a high standard of quality and allows you to make informed decisions when selecting a service provider.',
            ),
            ruleslist(
              text:
                  '6.  24/7 Customer Support: Our dedicated customer support team is available round the clock to assist you with any queries or concerns you may have. We strive to provide excellent customer service and ensure a smooth experience for our users.',
            ),
          ],
        ),
      ),
    );
  }

  Padding ruleslist({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
