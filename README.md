This program takes a JSON in the format of
```
{
  "videos": [
    {
      "title": string,
      "views": integer,
      "link": string,
      "thumbnail": string,
      "published_at": date_time,
      "likes": integer,
      "dislikes": integer
    }
  ],
  ...
}
```
and calculates the video with the highest like to dislike percentage, the average like to dislike percentage across all videos and the total views across all the videos.
