pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Document.sol";

contract TestDocument {

  function testAddDocument() {
    Document document = Document(DeployedAddresses.Document());

    document.addDocument("name", "pReferenceURL1", "pReferenceURL2");

    bytes32[4] memory expected = document.getDocument("name");

    bytes32 expectedName="name";
    bytes32 expectedURL1="pReferenceURL1";
    bytes32 expectedURL2="pReferenceURL2";

    Assert.equal(expected[0], expectedName, "Name should be same");
    Assert.equal(expected[1], expectedURL1, "Reference URL1 should be same");
    Assert.equal(expected[2], expectedURL2, "Reference URL2 should be same");
  }

  
}
