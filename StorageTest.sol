
contract StorageTest {
    bytes32[] public b;

    function put(bytes32[] memory _b) public {
        b = _b;
    }
}
