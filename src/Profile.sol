// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Profile is Ownable, ReentrancyGuard {
    constructor() Ownable(msg.sender) {}
    // 1. Implement a constructor to initialize the profile with a username, about me, and social profiles, ensuring social profile limits are respected.
    // 2. Add `updateAboutMe` to allow the owner to update their "about me" section.
    // 3. Implement `updateProfilePicture` and `updateBannerPicture` with URL length validation, emitting appropriate events.
    // 4. Add `updateLocation` to let the owner update their location and emit an event.
    // 5. Create functions to manage social profiles:
    //      - `addSocialProfile` to add new social links.
    //      - `removeSocialProfile` to remove a profile by index.
    //      - `updateSocialProfile` to update a profile by index.
    // 6. Implement `addTip` to allow users to send tips, maintaining a list of the last `MAX_TIPS` tips with timestamp, sender, message, and value.
    // 7. Add `withdrawTips` for the owner to withdraw accumulated tips securely, resetting the balance and emitting a `TipWithdrawn` event.
    // 8. Implement `getProfileDetails` to return all profile data, including username, about me, pictures, location, social profiles, recent tips, and timestamps.
}
