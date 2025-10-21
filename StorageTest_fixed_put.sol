
contract StorageTestFixed {
    bytes32[] public b;

    function put(bytes32[32] memory _b) public {
        delete b;
        for (uint i = 0; i < 32; i++) {
            b.push(_b[i]);
        }
    }

    function clear() public {
        delete b;
    }

    function getLength() public view returns (uint) {
        return b.length;
    }
}
