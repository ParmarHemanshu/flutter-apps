
import 'package:picsy_app/networking/AlbumDataGetRequest.dart';
import 'package:picsy_app/networking/PublicApiCalls/PostApiCall.dart';

class AlbumRepository{

 PostApiClient postApiClient;
 AlbumDataGetRequest albumDataGetRequest;

 AlbumRepository( this.postApiClient,
      this.albumDataGetRequest);
}
