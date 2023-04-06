require("@nomicfoundation/hardhat-toolbox");


/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  networks:{
    bnbt: {
      url: "https://hidden-methodical-arrow.bsc-testnet.discover.quiknode.pro/eb57e282f6931e0f0cbfb60ed5e5dbd8780ba5b2/",
      accounts:["61843ca73ba269dd9eaba1016c02e63c3fe191401f0d11dfcac57fa084b74ca8"],
    },
  },
  gasReporter: {
    enabled: true,
    outputFile: "gasreporter.txt",
    noColors: true,
  },

  etherscan:{
    apiKey: "CCT7NWTEC6KM42I2WNKWNZ32I4X3UVN3UG"
  },
  solidity: "0.8.18",
};
