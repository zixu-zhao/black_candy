# frozen_string_literal: true

module Api
  module V1
    class FavoritePlaylist::SongsController < ApiController
      before_action :find_playlist
      before_action :find_song

      def create
        @playlist.playlists_songs.create(song_id: @song.id, position: 1)
      end

      def destroy
        @playlist.songs.destroy(@song)
      end

      private

      def find_song
        @song = Song.find(params[:song_id])
      end

      def find_playlist
        @playlist = Current.user.favorite_playlist
      end
    end
  end
end
