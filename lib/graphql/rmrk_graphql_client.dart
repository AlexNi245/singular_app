import 'package:graphql_flutter/graphql_flutter.dart';

class RmrkGraphQlClient {
  factory RmrkGraphQlClient() => _singleton;

  RmrkGraphQlClient._internal() {
    final httpLink = HttpLink("edge-proxy.gql-rmrk.workers.dev/graphql");
    _client = GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore()));
  }

  static final RmrkGraphQlClient _singleton = new RmrkGraphQlClient._internal();
  late GraphQLClient _client;

  GraphQLClient get client => _client;
}
