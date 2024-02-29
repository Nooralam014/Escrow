var HDWalletProvider = require("truffle-hdwallet-provider");
const infuraKey = "https://kovan.infura.io/v3/59b1fb367a33445495b53e83b3c2772e";

module.exports = {
    networks: {
      development: {
        host: "127.0.0.1",
        port: 7545,
        network_id: "*"
      },
      kovan: {
        provider: function() {
          return new HDWalletProvider(MNEMONIC, infuraKey)
        },
        network_id: 42,
        gas: 4000000      
      }
    }
  };