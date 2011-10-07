# Flashback feed

An example server is accessible at [flashback-feed-rb.heroku.com](http://flashback-feed-rb.heroku.com/)

## Installation

Start by cloning the project using git.

`git clone git://github.com/oleander/flashback-feed-rb.git`

Navigate to the downloaded folder and run bundler.

`cd flashback-feed-rb && bundle install`

## Start the server

`bundle exec ruby ./server.rb`

Visit server in your web browser @ *http://localhost:4567*.

## Example data

``` javascript
{
    "created_at": "2011-10-07 14:03:55 +0200",
    "updated_at": "2011-10-07 14:03:56 +0200",
    "source": "https://www.flashback.org/heta-amnen",
    "title": "Flashback.org - Heta ämnen",
    "amount_of_threads": 100,
    "threads": [
        {
            "url": "https://www.flashback.org/t1677794",
            "title": "vems mobil nr är detta 0729312686",
            "category": "Telefoni",
            "category_url": "https://www.flashback.org/f20",
            "readers": "477",
            "views": "52625",
            "answers": "108"
        }
    ]
}
```

### Root object

- **created_at** (String) When was the server started?
- **updated_at** (String) When was the returned data updated?
- **source** (String) What was parsed?
- **title** (String) Url for source.
- **amount_of_threads** (Integer) Amount if results.
- **threads** (Array) A list of threads.

### Thread object

- **url** (String) Url to thread.
- **title** (String) Thread title.
- **category** (String) Thread category.
- **readers** (Integer) Amount of readers.
- **views** (Integer) Amount of views.
- **answers** (Integer) Amount of answers.

## Requirements

*FF* is tested in *OS X 10.7.1* using Ruby *1.9.2*.

## License

*FF* is released under the *MIT license*.