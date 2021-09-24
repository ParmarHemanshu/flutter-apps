// FutureBuilder<Album> _responseOnCall(BuildContext context) {
//   String url = "http://www.demoaws.picsy.in/api/";
//   final apiClient = ApiRequest(Dio(), baseUrl: url);
//   return FutureBuilder<Album>(
//       future: apiClient.getResponse(),
//       builder: (context, snapshot) {
//         try {
//           if (snapshot.connectionState == ConnectionState.done) {
//             final List<BookData>? listData = snapshot.data?.response!.bookData;
//             return _buildListView(context, listData!);
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             print("Waiting for Connection..");
//           } else if (snapshot.connectionState == ConnectionState.active) {
//             print("Connected successfully");
//           } else {
//             Center(
//               child: CircularProgressIndicator(
//                 color: Colors.redAccent,
//                 strokeWidth: 5,
//               ),
//             );
//           }
//         } on DioError catch (e) {
//           _checkDioErrors(e);
//         }
//         return Center(
//           child: CircularProgressIndicator(
//             color: Colors.redAccent,
//             strokeWidth: 5,
//           ),
//         );
//       });
// }

// import 'package:dio/dio.dart';
//
// void _checkDioErrors(DioError e) {
//   if (e.type == DioErrorType.response) {
//     print("Response Success");
//   } else if (e.type == DioErrorType.receiveTimeout) {
//     print("Get request timeout");
//   } else if (e.type == DioErrorType.connectTimeout) {
//     print("Connection timeout");
//   } else if (e.type == DioErrorType.other) {
//     print("Dio Error !!");
//   } else {
//     print("Something Went wrong !!!");
//   }
// }