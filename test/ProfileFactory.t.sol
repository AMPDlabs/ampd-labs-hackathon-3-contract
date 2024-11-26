// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/ProfileFactory.sol";

contract ProfileFactoryTest is Test {
    ProfileFactory factory;

    function setUp() public {
        factory = new ProfileFactory();
    }

    function testDeployment() public view {
        require(address(factory) != address(0), "ProfileFactory contract should be deployed");
    }
}
