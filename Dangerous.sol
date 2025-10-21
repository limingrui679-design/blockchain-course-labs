
contract Dangerous {
    mapping(address => uint) public deposits;

    function depositMoney() public payable {
        deposits[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(deposits[msg.sender] >= amount, "Not enough balance");
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
        deposits[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

