// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import "../src/Profile.sol";

contract ProfileTest is Test {
    Profile profile;

    function setUp() public {
        profile = new Profile();
    }

    function testDeployment() public {
        require(
            address(profile) != address(0),
            "Profile contract should be deployed"
        );
    }
}
