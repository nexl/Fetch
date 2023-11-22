# Fetch

Fetch is a simple application to fetch websites and save them locally for later viewing

# Getting Started 

### Prerequisites
* Make sure if you already install docker
* Clone this repository
* Build and run Fetch app with docker compose 

```
$ docker compose up -d
$ docker compose exec fetch bash
```

## Usage

### Fetch websites 
Fetch the website and save its asset locally inside the format  
```
# usage: ruby fetch.rb <website1> <website2> <websitex>
$ ruby fetch.rb https://autify.com/
```
* filename `[website].html`
* assets will be stored in a folder named `[website]_folder`


### Show metadata
Show metadata about what was fetched
```
# usage: ruby fetch.rb --metadata html_file
$ ruby fetch.rb --metadata autify.com.html
$ site: autify.com.html
$ num_links: 95
$ images: 120
$ last fetch: Wed Nov 22 2023 13:48 UTC
```