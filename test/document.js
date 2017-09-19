var Document = artifacts.require("./Document.sol");

contract('Document', function (accounts) {
  it("Initial document upload then get document tags", function () {
    return Document.deployed().then(function (instance) {
      instance.addDocument("name", "pReferenceURL1", "pReferenceURL1", { from: accounts[0] });
      return instance.getDocumentTags();
    }).then(function (documentArray) {
      var documentName = web3.toAscii(documentArray[0]).replace(/\u0000/g, '');
      var expectedname = "name";
      assert.equal(documentName, expectedname, "Name should match");
    });
  });
  it("Document Delete when no document", function () {
    return Document.deployed().then(function (instance) {
      return instance.deleteDocument("no-document", { from: accounts[0] });
    }).then(function (returnValue) {
      assert(false, "testThrow was supposed to throw but didn't.");
    }).catch(function (error) {
      assert(true, "Expecting throw on delete of unknown document");
    });
    //.then(function (documentArray) {
    //   var documentName = web3.toAscii(documentArray[0]).replace(/\u0000/g, '');
    //   var expectedname="name";
    //   assert.equal(documentName, expectedname, "Name should match");
    // });
  });
});
