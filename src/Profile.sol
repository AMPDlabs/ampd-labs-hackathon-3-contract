// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Profile is Ownable, ReentrancyGuard {
    constructor() Ownable(msg.sender) {}

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
