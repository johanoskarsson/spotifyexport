This is a super simple script to dump out Spotify playlists in such a way that they are easy to copy paste
into bff.fm's DJ admin system thingie.

## Installation

```
bundle install
cp config.yaml.template config.yaml
```

Finally, edit config.yaml to include your keys and stuff.

## Usage

`bundle exec ruby spotifyexport.rb https://open.spotify.com/user/someuser/playlist/3VVo3shwuZ346NHP04pEEp`
