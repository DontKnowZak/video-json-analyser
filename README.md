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

Going forward on this project I would focus on, more error checking, testing output and general refactoring.

I felt that as I knew what single JSON I was running on the program, the size of the JSON and the size of the project that I did not need to check the validity of the data being processed. This would however be one of the next steps I would take to expand upon this program.

I did not test the printed output as all the logic was handled outside of this class and merely the results passed down and placed into a pre-constructed string.

In terms of refactoring I would go deeper into the program to improve to overall readability for other developers and ensure the code is efficient. I also debated on and didn't completely settle on whether to use one loop and perform the necessary actions set out in the guideline in that loop or perform each action completely independently and loop through for each action. In the program I decided to separate each feature.
