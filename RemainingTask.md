# Remaining tasks

### The app itself
* Write unit test (Not in requirements)
* add a new command: `help` to provide information on how to use this app (Not in requirements)
* Fix the metadata command to follow sample 

```
Based on the input, remove the scheme and add .html 
For the example: https://www.google.com will be recognized as `www.google.com.html`
When print the website's metadata, remove .html extension so it becomes `www.google.com`
```

### Fetching Data

Seems like `open-uri` has a problem when downloading / accessing URL that has query parameter like `https://autify.com/wp-content/plugins/wp-slick-slider-and-image-carousel/assets/css/slick.css?ver=3.5`

I didn't use a third-party gem for this challenge (tried to complete it without one), I think it would be simplier to use `Nokogiri` to fetch those assets, replace the URLs to reference local files count the total number of links and images


