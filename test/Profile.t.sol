// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import "../src/Profile.sol";

contract ProfileTest is Test {
    Profile profile;

    function setUp() public {
        // Initialize the Profile contract with test data
        string[] memory socialProfiles = new string[](2);
        socialProfiles[0] = "https://twitter.com/test";
        socialProfiles[1] = "https://github.com/test";
        profile = new Profile("test", "Test description", socialProfiles);
    }

    function testDeployment() public view {
        require(address(profile) != address(0), "Profile contract should be deployed");
    }

    function testAddTipAndGetProfileDetails() public {
        // Add a tip
        uint256 tipAmount = 1 ether;
        string memory message = "Great profile!";

        vm.deal(address(this), tipAmount); // Provide the test contract with some ETH to tip
        profile.addTip{value: tipAmount}(message);

        // Retrieve the profile details
        Profile.ProfileDetails memory details = profile.getProfileDetails();

        // Verify totalTips is updated
        assertEq(details.totalTips, tipAmount, "Total tips does not match the tip amount");

        // Verify the recentTips array contains the new tip
        assertEq(details.recentTips.length, 1, "Recent tips array length mismatch");
        Profile.Tip memory tip = details.recentTips[0];
        assertEq(tip.value, tipAmount, "Tip value mismatch");
        assertEq(tip.from, address(this), "Tip sender address mismatch");
        assertEq(tip.message, message, "Tip message mismatch");
        assertEq(tip.timestamp > 0, true, "Tip timestamp should be greater than 0");
    }
}
