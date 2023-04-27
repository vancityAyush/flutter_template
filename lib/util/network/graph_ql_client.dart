import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/util/config/environment.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GQLClient {
  static GQLClient? _instance;
  static GQLClient get instance => _instance ??= GQLClient._();
  late final Link _link;
  late final ValueNotifier<GraphQLClient> client;

  GQLClient._() {
    var options = BaseOptions(
      baseUrl: Environment.instance.baseUrl,
      persistentConnection: true,
    );
    final HttpLink httpLink = HttpLink(
      "https://api-staging.crooze.app/v1/ql",
    );
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${"token"}',
    );
    final Link link = authLink.concat(httpLink);
    client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
  }

  Future<QueryResult> query(String query,
      {required Map<String, dynamic> variables}) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
    );
    final QueryResult result = await client.value.query(options);
    return result;
  }

  Future<QueryResult> mutate(String query,
      {required Map<String, dynamic> variables}) async {
    final MutationOptions options = MutationOptions(
      document: gql(query),
      variables: variables,
    );
    final QueryResult result = await client.value.mutate(options);
    return result;
  }
}
