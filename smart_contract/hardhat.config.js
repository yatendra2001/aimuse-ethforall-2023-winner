require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
const WALLET_PRIVATE_KEY = process.env.WALLET_PRIVATE_KEY;
const ALCHEMY_KEY_TEST = process.env.ALCHEMY_KEY_TEST;
const ALCHEMY_KEY_PROD = process.env.ALCHEMY_KEY_PROD;
const POLYGONSCAN_KEY = process.env.POLYGONSCAN_KEY;
module.exports = {
  networks: {
    Mumbai: {
      url: ALCHEMY_KEY_TEST,
      accounts: [WALLET_PRIVATE_KEY]
    },
    Main: {
      url: ALCHEMY_KEY_PROD,
      accounts: [WALLET_PRIVATE_KEY]
    },
    "mantle-testnet": {
      url: "https://rpc.testnet.mantle.xyz/",
      accounts: [process.env.WALLET_PRIVATE_KEY] // Uses the private key from the .env file
    }
  },
  solidity: "0.8.4",
  etherscan: {
    apiKey: POLYGONSCAN_KEY
  }
};