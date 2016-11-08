// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar.example.silly;

// **************************************************************************
// Generator: ApiGenerator
// Target: class ExampleApi
// **************************************************************************

abstract class _$JaguarExampleApi implements ApiInterface {
  static const List<RouteBase> _routes = const <RouteBase>[
    const Route('/ping', methods: const <String>['GET']),
    const Put('/pong',
        statusCode: 201, headers: const {"pong-header": "silly-pong"}),
    const Route('/echo/pathparam/:message', methods: const <String>['POST']),
    const Route('/echo/queryparam', methods: const <String>['POST']),
    const Ws('/ws')
  ];

  String ping();

  String pong();

  String echoPathParam(String message);

  String echoQueryParam({String message});

  Future<dynamic> websocket(WebSocket ws);

  Future<bool> handleApiRequest(HttpRequest request) async {
    PathParams pathParams = new PathParams();
    QueryParams queryParams = new QueryParams(request.uri.queryParameters);
    bool match = false;

    match =
        _routes[0].match(request.uri.path, request.method, '/api', pathParams);
    if (match) {
      String rRouteResponse;
      rRouteResponse = ping();
      request.response.statusCode = 200;
      request.response.write(rRouteResponse.toString());
      await request.response.close();
      return true;
    }

    match =
        _routes[1].match(request.uri.path, request.method, '/api', pathParams);
    if (match) {
      String rRouteResponse;
      rRouteResponse = pong();
      request.response.statusCode = 201;
      request.response.headers.add("pong-header", "silly-pong");
      request.response.write(rRouteResponse.toString());
      await request.response.close();
      return true;
    }

    match =
        _routes[2].match(request.uri.path, request.method, '/api', pathParams);
    if (match) {
      String rRouteResponse;
      rRouteResponse = echoPathParam(
        (pathParams.getField('message')),
      );
      request.response.statusCode = 200;
      request.response.write(rRouteResponse.toString());
      await request.response.close();
      return true;
    }

    match =
        _routes[3].match(request.uri.path, request.method, '/api', pathParams);
    if (match) {
      String rRouteResponse;
      rRouteResponse = echoQueryParam(
        message: (queryParams.getField('message')),
      );
      request.response.statusCode = 200;
      request.response.write(rRouteResponse.toString());
      await request.response.close();
      return true;
    }

    match =
        _routes[4].match(request.uri.path, request.method, '/api', pathParams);
    if (match) {
      dynamic rRouteResponse;
      WebSocket ws = await WebSocketTransformer.upgrade(request);
      rRouteResponse = await websocket(
        ws,
      );
      return true;
    }

    return false;
  }
}