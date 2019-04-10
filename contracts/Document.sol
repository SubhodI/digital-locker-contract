pragma solidity ^0.5.0;
// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract Document {  
 
    //  Document structure
    struct Document {
        bytes32 name;
        bytes32 referenceURL1;
        bytes32 referenceURL2;
        uint256 date;

    }

    struct Tag {
        bytes32[] documentTags;
    }

    //map of documents
    mapping(address => mapping(bytes32 => Document)) documents;
    mapping(address => Tag) tags;

    // Events for document
    event AddDocument(address indexed from, bytes32 indexed docName);
    event UpdateDocument(address indexed from, bytes32 indexed docName);
    event DeleteDocument(address indexed from, bytes32 indexed docName);

    // add document function
    function addDocument(bytes32 name, bytes32 pReferenceURL1, bytes32 pReferenceURL2) {
        documents[msg.sender][name] = Document({
            name: name,
            date: now,
            referenceURL1: pReferenceURL1,
            referenceURL2: pReferenceURL2
        });
        tags[msg.sender].documentTags.push(name);
        AddDocument(msg.sender, name); //Log event
    }

    // update document function
    function updateDocument(bytes32 name, bytes32 pReferenceURL1, bytes32 pReferenceURL2) {
        documents[msg.sender][name] = Document({
            name: name,
            date: now,
            referenceURL1: pReferenceURL1,
            referenceURL2: pReferenceURL2
        });
        UpdateDocument(msg.sender, name); // Log event
    }

    // delete document function
    function deleteDocument(bytes32 name) {
        for (uint i = 0; i < tags[msg.sender].documentTags.length; i++) {
            if (tags[msg.sender].documentTags[i] == name) {
                delete tags[msg.sender].documentTags[i];
            } else {
                throw;
            }
        }
        delete documents[msg.sender][name];
        DeleteDocument(msg.sender, name); // Log event
    }

    // get document data
    function getDocument(bytes32 pName) view returns(bytes32[4]) {
        bytes32[4] memory temp;
        temp[0] = documents[msg.sender][pName].name;
        temp[1] = documents[msg.sender][pName].referenceURL1;
        temp[2] = documents[msg.sender][pName].referenceURL2;
        temp[3] = bytes32(documents[msg.sender][pName].date);
        return temp;
    }

    // get document list
    function getDocumentTags() view returns(bytes32[]) {
        return tags[msg.sender].documentTags;
    }

}
