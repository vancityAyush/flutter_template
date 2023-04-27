import 'package:flutter/material.dart';
import 'package:flutter_template/util/network/graph_ql_client.dart';

class LoginPhone extends StatelessWidget {
  LoginPhone({Key? key}) : super(key: key);
  final GQLClient client = GQLClient.instance;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                hintText: "Enter your phone number",
              ),
              onChanged: (value) async {
                final result = await client.mutate(
                  """
                  mutation {
                    sendOtp(phone: "$value") {
                      message
                    }
                  }
                  """,
                  variables: {},
                );
                print(result.data);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                GQLClient.instance.client.value.resetStore();
                String mutation = """
                mutation {
                auth {
                generate(data: { mobile: "+919876543210" }) {
                expires_at
                }
              }
            }

              """;
                final res = await GQLClient.instance.mutate(mutation,
                    variables: {"mobile": phoneController.text});
                print(res.data);
              },
              child: const Text("Get otp"),
            ),
            //otp entry
            TextField(
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              controller: otpController,
              decoration: const InputDecoration(
                hintText: "Enter your otp",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await client.mutate(
                  """
                  mutation {
  auth {
    verify(data: { mobile: ${phoneController.text}, otp: ${otpController.text} }) {
      id
      name
      email
      mobile
    }
  }
}

                  """,
                  variables: {},
                );
                print(result.data);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result.data.toString()),
                  ),
                );
              },
              child: const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
