var ConvertLib = artifacts.require("./ConvertLib.sol");
var Document = artifacts.require("./Document.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, Document);
  deployer.deploy(Document);
};
