// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface INFT is IERC721{

    function mint() external;

}
