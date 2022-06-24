
# Project 2 - *Twitter*

**twitter** is a basic twitter app to read and compose tweets the [Twitter 
API](https://apps.twitter.com/).

Time spent: **20** hours spent in total

## User Stories

The following **core** features are completed:

**A user should**

- [x] See an app icon in the home screen and a styled launch screen
- [x] Be able to log in using their Twitter account
- [x] See at least the latest 20 tweets for a Twitter account in a Table 
View
- [x] Be able to refresh data by pulling down on the Table View
- [x] Be able to like and retweet from their Timeline view
- [x] Only be able to access content if logged in
- [x] Each tweet should display user profile picture, username, screen 
name, tweet text, timestamp, as well as buttons and labels for favorite, 
reply, and retweet counts.
- [x] Compose and post a tweet from a Compose Tweet view, launched from a 
Compose button on the Nav bar.
- [x] See Tweet details in a Details view
- [x] App should render consistently all views and subviews in recent 
iPhone models and all orientations

The following **stretch** features are implemented:

**A user could**

- [x] Be able to **unlike** or **un-retweet** by tapping a liked or 
retweeted Tweet button, respectively. (Doing so will decrement the count 
for each)
- [ ] Click on links that appear in Tweets
- [ ] See embedded media in Tweets that contain images or videos
- [ ] Reply to any Tweet (**2 points**)
  - Replies should be prefixed with the username
  - The `reply_id` should be set when posting the tweet
- [x] See a character count when composing a Tweet (as well as a warning) 
(280 characters) (**1 point**)
- [ ] Load more tweets once they reach the bottom of the feed using 
infinite loading similar to the actual Twitter client
- [ ] Click on a Profile image to reveal another user's profile page, 
including:
  - Header view: picture and tagline
  - Basic stats: #tweets, #following, #followers
- [ ] Switch between **timeline**, **mentions**, or **profile view** 
through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize 
the header image. (**4 points**)

The following **additional** features are implemented:

- [x] Cleaner like and retweet counts (i.e. 14.3K vs 14321)

Please list two areas of the assignment you'd like to **discuss further 
with your peers** during the next class (examples include better ways to 
implement something, how to extend your app in certain ways, etc):

1. Having difficulty with extending the app for different screen sizes
2. Infinite scrolling

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![Video Walkthrough](twitter.gif)

GIF created with [Kap](https://getkap.co/).

## Notes

Took a while to get the layout going correctly - especially with toggling 
retweet/like butotns

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in 
your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - 
networking task library
- [DateTools](https://github.com/MatthewYork/DateTools) - dating formatter 
library

## License

    Copyright 2022 Andreas Lordos

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
implied.
    See the License for the specific language governing permissions and
    limitations under the License.
