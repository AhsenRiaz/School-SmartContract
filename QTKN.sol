pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract QTKN is ERC20 {
    address private Owner;
    modifier onlyOwner()
    {
        require(msg.sender == owner, "You are not the owner");
        _;
    }
    constructor() ERC20("QTKN", "TK") {
        Owner = msg.sender;
    }
    uint private tax;
    uint public account;
    uint private basePrice;
    uint private schoolShare;
    uint public coursePrice;
    mapping (address => bool) public allowToCourse;
    function setCoursePrice (uint _tax, uint _basePrice, uint _schoolShare) internal onlyOwner
    {
        require(allowToCourse[msg.sender] == true,"Not Allowed");
                tax = _tax;
                basePrice = _basePrice;
                schoolShare = _schoolShare;
                coursePrice= tax+basePrice+schoolShare;
    }

    function TeacherAllowed (address _addrl, bool _allow) public onlyOwner {
            allowToCourse[_addrl] = _allow;
    }
}