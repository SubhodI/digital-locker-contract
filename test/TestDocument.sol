pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Document.sol";

contract TestDocument {

  function testAddDocument() {
    Document document = Document(DeployedAddresses.Document());

    document.addDocument("name", "pReferenceURL1", "pReferenceURL2");

    bytes32[4] memory uploaded = document.getDocument("name");

    bytes32 expectedName="name";
    bytes32 expectedURL1="pReferenceURL1";
    bytes32 expectedURL2="pReferenceURL2";

    Assert.equal(uploaded[0], expectedName, "Name should be same");
    Assert.equal(uploaded[1], expectedURL1, "Reference URL1 should be same");
    Assert.equal(uploaded[2], expectedURL2, "Reference URL2 should be same");
  }

   function testUpdateDocument() {
    Document document = Document(DeployedAddresses.Document());

    document.updateDocument("name", "IPFS-link1", "IPFS-link2");

   bytes32[4] memory uploaded = document.getDocument("name");

   bytes32 expectedName="name";
   bytes32 expectedURL1="IPFS-link1";
   bytes32 expectedURL2="IPFS-link2";


    Assert.equal(uploaded[0], expectedName, "Name should be same");
    Assert.equal(uploaded[1], expectedURL1, "Reference URL1 should be IPFS-link1");
    Assert.equal(uploaded[2], expectedURL2, "Reference URL2 should be IPFS-link2");
  }

  function testDeleteDocument() {
    Document document = Document(DeployedAddresses.Document());

    document.deleteDocument("name");

    bytes32[4] memory uploaded = document.getDocument("name");

    bytes32 expectedName="";
    bytes32 expectedURL1="";
    bytes32 expectedURL2="";


    Assert.equal(uploaded[0], expectedName, "Name should be empty");
    Assert.equal(uploaded[1], expectedURL1, "Reference URL1 should be empty");
    Assert.equal(uploaded[2], expectedURL2, "Reference URL2 should be empty");
  }

  
  
}
