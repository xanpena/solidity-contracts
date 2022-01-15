pragma solidity ^0.5.0;

contract Cars {
    address                 owner;
    mapping(address => Car) cars;
    uint256                 price;
    uint256[]               identifiers
    struct Car {
        uint256 identifier;
        string  trademark;
        uint32  horses;
        uint32  km;
    }

    modifier filterPrice(uint256 _price) {
        require(_price == price);
        _;
    }

    constructor(uint256 _price) public {
        owner = msg.sender;
        price = _price;
    }

    function addCar(uint256 _id, string memory _trademark, uint32 _horses, uint32 km) public filterPrice(msg.value) payable {
        identifiers.push(_id);
        cars[msg.sender].identifier = _id;
        cars[msg.sender].trademark  = _trademark;
        cars[msg.sender].horses     = _horses;
        cars[msg.sender].km         = _km;
    }

    function getCar() external view returns(string memory trademark, uint32 horses, uint32 km) {
        trademark = cars[msg.sender].trademark;
        horses    = cars[msg.sender].horses;
        km        = cars[msg.sender].km;
    }

    
    function countIdentifiers() external view returns(uint256) {
        return identifiers.length;
    }
}
