import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  // ignore: prefer_typing_uninitialized_variables
  var _session;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        debugPrint(session.accounts[0]);
        debugPrint(session.chainId.toString());
        setState(() {
          _session = session;
        });
      } catch (exp) {
        debugPrint(exp.toString());
      }
    }
  }

  getNetworkName(chainId) {
    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 5001:
        return 'Mantle Testnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(
              () {
                _session = session;
              },
            ));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
              debugPrint(_session.accounts[0]);
              debugPrint(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/main_page_image.png',
              fit: BoxFit.fitHeight,
              scale: 8,
            ),
            (_session != null)
                ? Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '${_session.accounts[0]}',
                          style: GoogleFonts.inconsolata(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Chain: ',
                              style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              getNetworkName(_session.chainId),
                              style: GoogleFonts.inconsolata(fontSize: 16),
                            )
                          ],
                        ),
                        (_session.chainId != 1)
                            ? const Row(
                                children: [
                                  Icon(Icons.warning,
                                      color: Colors.redAccent, size: 15),
                                  Text('Network not supported. Switch to '),
                                  Text(
                                    'Mumbai Testnet',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: SliderButton(
                                  action: () async {
                                    // TODO: Navigate to main page
                                  },
                                  label: const Text('Slide to login'),
                                  icon: const Icon(Icons.check),
                                ),
                              )
                      ],
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => loginUsingMetamask(context),
                    child: const Text("Connect with Metamask"))
          ],
        ),
      ),
    );
  }
}
