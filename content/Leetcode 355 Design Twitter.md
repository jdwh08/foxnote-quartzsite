---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/heap
  - todo
edited: 2025-08-06T20:22
created: 2025-07-23T18:42:00
---
# Problem:
Design a simplified version of Twitter where users can post tweets, follow/unfollow another user, and is able to see the `10` most recent tweets in the user's news feed.

Implement the `Twitter` class:

- `Twitter()` Initializes your twitter object.
- `void postTweet(int userId, int tweetId)` Composes a new tweet with ID `tweetId` by the user `userId`. Each call to this function will be made with a unique `tweetId`.
- `List<Integer> getNewsFeed(int userId)` Retrieves the `10` most recent tweet IDs in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user themself. Tweets must be **ordered from most recent to least recent**.
- `void follow(int followerId, int followeeId)` The user with ID `followerId` started following the user with ID `followeeId`.
- `void unfollow(int followerId, int followeeId)` The user with ID `followerId` started unfollowing the user with ID `followeeId`.

#### Bounds
- `1 <= userId, followerId, followeeId <= 500`
- `0 <= tweetId <= 104`
- All the tweets have **unique** IDs.
- At most `3 * 104` calls will be made to `postTweet`, `getNewsFeed`, `follow`, and `unfollow`.
- A user cannot follow himself.

#### Examples
**Input**: `["Twitter", "postTweet", "getNewsFeed", "follow", "postTweet", "getNewsFeed", "unfollow", "getNewsFeed"]`
**Output**: `[null, null, [5], null, null, [6, 5], null, [5]]`
**Explanation**:
```java
Twitter twitter = new Twitter();
twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
twitter.follow(1, 2);    // User 1 follows user 2.
twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
twitter.unfollow(1, 2);  // User 1 unfollows user 2.
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5], since user 1 is no longer following user 2.
```

---
# Notes:
We store the data in [[Hashmap]] for follows.
I was debating what the best way to store tweets was.
- I could see an array, or linkedlist with dequeue, etc. per person
- I can also see one big thing of tweets, but this would make it hard to determine the followers. 

---
# Attempts:

##### Attempt 1
We'll use a max heap to get the most recent values. We add one tweet for each user. We re-populate tweets once the user's tweet is taken until we are done.

##### Attempt 2
A finnicky little thing. 
- We need to ensure the person always gets their own tweets
- We might potentially have the user try and unfollow someone they are not following
- We need to ensure we keep the followee and user index to populate the next tweet

---
# Solution:

```python
class Twitter:

    def __init__(self):
        self.tweets: dict[int, list[tuple[int, int]]] = defaultdict(list)
        self.subs: dict[int, set[int]] = defaultdict(set)
        self.tweetnum = 0

    def postTweet(self, userId: int, tweetId: int) -> None:
        # NOTE: we are using negative tweetnum for a MAX HEAP
        self.tweets[userId].append((self.tweetnum, tweetId))
        self.tweetnum += 1

    def getNewsFeed(self, userId: int) -> List[int]:
        NUM_TWEETS_IN_FEED: int = 10
        # create a max heap across all followees
        followees = self.subs[userId]
        # make sure you can always see your own tweets
        followees.add(userId)
        max_heap: list[int] = []
        heapq.heapify(max_heap)
        output: list[int] = []

        for followee in followees:
            # get the most recent tweet from each followee
            sub_num_tweets = len(self.tweets[followee])-1
            if sub_num_tweets >= 0:
                latest_tweet = self.tweets[followee][sub_num_tweets]
                # heap has (-tweetnum, tweetid, userid, usrtweetidx)
                heapq.heappush(
                    max_heap,
                    (
	                    -latest_tweet[0],
	                    latest_tweet[1],
	                    followee,
	                    sub_num_tweets
	                )
                )

        while len(output) < NUM_TWEETS_IN_FEED and len(max_heap) > 0:
            _, newtweetid, newfollowee, sub_num_tweets = heapq.heappop(max_heap)
            output.append(newtweetid)

            # update the max heap with the newest tweet from the followee
            sub_num_tweets -= 1
            if sub_num_tweets >= 0:
                latest_tweet = self.tweets[newfollowee][sub_num_tweets]
                # heap has (-tweetnum, tweetid, userid, usrtweetidx)
                heapq.heappush(
                    max_heap,
                    (
	                    -latest_tweet[0],
	                    latest_tweet[1],
	                    newfollowee,
	                    sub_num_tweets
	                )
                )

        return output


    def follow(self, followerId: int, followeeId: int) -> None:
        self.subs[followerId].add(followeeId)

  
    def unfollow(self, followerId: int, followeeId: int) -> None:
        if followerId == followeeId:
            # you can't unfollow yourself!
            return
        if followeeId in self.subs[followerId]:
            self.subs[followerId].remove(followeeId)
```

----
# Source:
https://leetcode.com/problems/design-twitter/description/