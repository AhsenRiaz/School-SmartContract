//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract course is QTKN {
    uint public co;

    mapping (address => bool) public allow;
        struct Course {
            string name;
            uint subjects;
            uint timeEnd;
    }                                                                      
    mapping (uint=>Course) private  coursdetails;

    function addCourseDetails(uint courseID, string memory _name, uint _subjects,uint timeEnd) public onlyOwner {
        require(allowToCourse[msg.sender] == true,"Not Allowed");
        co = courseID;
        coursdetails[c]=Course(_name,_subjects,timeEnd);
    }

    function buyCourse() public payable {
        require (msg.value == coursePrice,"Invalid amount Please check the price again");
        account = account+msg.value;
        allow[msg.sender] = true;
    }

    function getCourse(uint _cid) public view returns(string memory, uint) {
        require(allow[msg.sender] == true ,"Purchase the course");
        return(coursdetails[_cid].name, coursdetails[_cid].subjects);
    }

    function fundsTranfer(address payable _to, uint _amount) public onlyowner payable {
        _to.transfer(_amount);
    }
}
