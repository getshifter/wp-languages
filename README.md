# WordPress Language Packs

https://make.wordpress.org/polyglots/teams/

## Usage example

with docker-compose

```
version: '3.7'
services:
  wp:
    volumes:
      - plugindata:/path/to/wp-content/languages
  plugins:
    image: getshifter/wp-languages:5.4
    volumes:
      - languages:/srv/languages
volumes:
  languages:
```

multi-stage building

```
FROM getshifter/wp-languages:5.4 as languages
RUN /bin/true

FROM wordpress:latest

... do something ...

COPY --from=languages /srv/languages /path/to/wp-content/languages
```
