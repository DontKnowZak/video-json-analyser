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
and calculates the video with the highest like to dislike percentage, the average like to dislike percentage across all videos, total views across all the videos and the average time between each video.

In order to use the program you must clone this repository and run
```
ruby app.rb path-to-json
```
i.e.
```
ruby app.rb zoella_videos.json
```
