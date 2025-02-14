
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sirteefy/sirteefy/data/remote/models/social_media_links.dart';


abstract class SocialMediaLinksRemoteDataSource {
  Future<SocialMediaLinks> getSocialMediaLinks();
}

class SocialMediaLinksFirebaseImplementation
    implements SocialMediaLinksRemoteDataSource {
  final firestore = FirebaseFirestore.instance;
  SocialMediaLinks socialMediaLinks = SocialMediaLinks();

  @override
  Future<SocialMediaLinks> getSocialMediaLinks() async {
    final querySnapshot = await firestore.collection('Social').get();
    for (var doc in querySnapshot.docs) {
      // Access the fields of each document
      String facebook = doc.data()['facebook'];
      String twitter = doc.data()['twitter'];
      String linkedin = doc.data()['linkedin'];
      String github = doc.data()['github'];
      socialMediaLinks = SocialMediaLinks(
        facebook: facebook,
        twitter: twitter,
        linkedin: linkedin,
        github: github,
      );
    }
    return socialMediaLinks;
  }
}
