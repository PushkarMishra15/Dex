require("@nomicfoundation/hardhat-toolbox");

// Go to https://infura.io, sign up, create a new API key
// in its dashboard, and replace "KEY" with it
const INFURA_API_KEY = "d08014512f2741f5b31ab7779598acc5";

// Replace this private key with your Sepolia account private key
// To export your private key from Coinbase Wallet, go to
// Settings > Developer Settings > Show private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Beware: NEVER put real Ether into testing accounts
const SEPOLIA_PRIVATE_KEY = "99fb6b81adb7b801b370944f6e3ce5361c9787f5afbddfa33d7e4cdb0e598035";

module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: `https://goerli.infura.io/v3/d08014512f2741f5b31ab7779598acc5`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  }
};