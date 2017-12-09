require 'rspotify'
require 'uri'
require 'yaml'

if ARGV.empty?
  puts "Need to specify the Spotify playlist to export as a paramter."
  puts "For example: https://open.spotify.com/user/skr/playlist/3VVo3shwuZ346NHP04pEEp"
  exit
end

config = YAML.load_file('config.yaml')

RSpotify::authenticate(
  config['spotify']['client']['id'],
  config['spotify']['client']['secret']
)

oauth = config['spotify']['oauth']

user = RSpotify::User.new(oauth)


uri = URI(ARGV[0])
parts = uri.path.split("/")
playlist_id = parts.last
user = parts[2]

playlist = RSpotify::Playlist.find(user, playlist_id)
tracks = playlist.tracks

tracks.each do |t|
  album = RSpotify::Album.find(t.album.id)
  puts "Title: #{t.name}"
  puts "Arist: #{t.artists.map { |a| a.name}.join(",")}"
  puts "Album: #{t.album.name}"
  puts "Label: #{album.label}"
  puts
end
