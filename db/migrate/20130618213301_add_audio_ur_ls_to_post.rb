class AddAudioUrLsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :intro_audio_url, :string
    add_column :posts, :full_audio_url, :string
    add_column :posts, :simple_audio_url, :string
  end
end
