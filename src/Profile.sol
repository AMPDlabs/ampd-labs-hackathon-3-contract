// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Profile is Ownable, ReentrancyGuard {
    event TipRecieved(address indexed from, string message);

    struct Tip {
        uint256 value;
        address from;
        string message;
        uint256 timestamp;
    }

    struct ProfileDetails {
        string username;
        string aboutMe;
        string[] socialProfiles;
        Tip[] recentTips;
        uint256 totalTips;
        uint256 created;
    }

    ProfileDetails private profileDetails;

    constructor(string memory _username, string memory _aboutMe, string[] memory _socialProfiles) Ownable(msg.sender) {
        profileDetails.username = _username;
        profileDetails.aboutMe = _aboutMe;
        profileDetails.socialProfiles = _socialProfiles;
        profileDetails.created = block.timestamp;
    }

    function updateAboutMe(string memory _aboutMe) public onlyOwner {
        profileDetails.aboutMe = _aboutMe;
    }

    function addTip(string memory _message) public payable {
        require(msg.value > 0, "You cannot tip zero!");

        Tip memory newTip = Tip({timestamp: block.timestamp, from: msg.sender, message: _message, value: msg.value});
        profileDetails.recentTips.push(newTip);
        profileDetails.totalTips += newTip.value;
        emit TipRecieved(newTip.from, newTip.message);
    }

    function withdraw() public onlyOwner nonReentrant {
        payable(owner()).transfer(address(this).balance);
    }

    function getProfileDetails() public view returns (ProfileDetails memory) {
        return profileDetails;
    }

    // 1. 📌 Implement a constructor to initialize the profile with a username, about me, and social profiles
    //  - ⭐️ Limit the number of social profiles
    //  - ⭐️ Emit ProfileCreated event

    // 2. 📌 Create a ProfileDetails struct with all profile values
    //  - 📌 Create a public profileDetails variable
    //  - 📌 Set the values of profileDetails to the incoming values in the constructor.

    // 3. Add `updateAboutMe` to allow the owner to update their "about me" section.
    //  - ⭐️ emit ProfileUpdated event

    // 4. 📌 Implement `updateProfilePicture` and `updateBannerPicture` with URL length validation, emitting appropriate events.
    //  - 📌 Add add other update functions for all properties.
    //  - ⭐️ emit ProfileUpdated event

    // 4. 📌 Create add Tip functionality
    //  - 📌 Create Tip struct (timestamp, from, message, and value)
    //  - 📌 Create addTip function
    //  - ⭐️ emit TipReceived event
    //  - ⭐️ Track 25 recent tips
    //  - ⭐️ Create totalTip property

    // 5. 📌 Add `withdrawTips` for the owner to withdraw accumulated tips securely
    //  - ⭐️ emit TipWithdrawn event
}
