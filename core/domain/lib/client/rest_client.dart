import 'package:domain/client/interceptors/AppInterceptor.dart';
import 'package:domain/client/responses/characters_response.dart';
import 'package:domain/globals/_globals.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

// Retrofit doc: https://pub.dev/packages/retrofit for more examples.
// Dio httpClient documentation: https://pub.dev/packages/dio#interceptors
// run 'flutter pub run build_runner build' every time you change this file
// or 'flutter pub run build_runner build --delete-conflicting-outputs'
@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient get instance => getIt<RestClient>();

  static void initialize() {
    final dio = Dio();
    //Adding interceptors
    dio.interceptors.add(AppInterceptor());
    //Adding default headers
    dio.options.headers["Demo-Header"] = "demo header";
    register(RestClient(dio));
  }

  static void register(RestClient httpClient) =>
      getIt.registerSingleton<RestClient>(httpClient);

  @GET("/character/?page={page}")
  Future<CharactersResponse> getCharacters(@Path("page") int page);

/*
  * examples
  *
  @GET("/tasks")
  Future<Task> getTasks(@Header("Content-Type") String contentType );

  @GET("/tasks")
  @Headers(<String, dynamic>{
      "Content-Type" : "application/json",
      "Custom-Header" : "Your header"
  })
  Future<Task> getTasks();

  @GET("/tasks/{id}")
  Future<Task> getTask(@Path("id") String id);

  @GET('/demo')
  Future<String> queries(@Queries() Map<String, dynamic> queries);

  @GET("https://httpbin.org/get")
  Future<String> namedExample(
      @Query("apikey") String apiKey,
      @Query("scope") String scope,
      @Query("type") String type,
      @Query("from") int from
  );

  @PATCH("/tasks/{id}")
  Future<Task> updateTaskPart(
      @Path() String id, @Body() Map<String, dynamic> map);

  @PUT("/tasks/{id}")
  Future<Task> updateTask(@Path() String id, @Body() Task task);

  @DELETE("/tasks/{id}")
  Future<void> deleteTask(@Path() String id);

  @POST("/tasks")
  Future<Task> createTask(@Body() Task task);

  @POST("http://httpbin.org/post")
  Future<void> createNewTaskFromFile(@Part() File file);

  @POST("http://httpbin.org/post")
  @FormUrlEncoded()
  Future<String> postUrlEncodedFormData(@Field() String hello);
  * */
}
