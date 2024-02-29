// var FirstContract = artifacts.require('FirstContract');
var Excercise = artifacts.require('Excercise');
// var Seller = artifacts.require('Seller');
module.exports = (deployer) => {
// deployer.deploy(FirstContract);
deployer.deploy(Excercise);
// deployer.deploy(Seller);
}