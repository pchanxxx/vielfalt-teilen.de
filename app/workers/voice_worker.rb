require 'net/http'
require 'html/sanitizer'

class VoiceWorker
  include Sidekiq::Worker

  def perform(post_id, flags)
    post = Post.find(post_id)

    base_url = 'http://api.voicerss.org/?key=416663ac3c184b7ea5c165e1ecb60fa0&hl=de-de&f=32khz_16bit_mono&src='

    post_audio_path = Rails.root.join('public', 'audio', 'posts', "#{post_id}")
    post_audio_url = "/audio/posts/#{post_id}/"

    unless File.directory?(post_audio_path)
      FileUtils.mkdir_p(post_audio_path)
    end

    puts "Flags: #{flags}"
    puts "Intro Blank: #{post.intro.blank?}"

    # Fetch post intro text
    if flags.include? 'intro' and !post.intro.blank?
      full_url = "#{base_url}#{CGI::escape strip_tags(post.intro)}"
      post.intro_audio_url = post_audio_url + 'intro.mp3'

      puts full_url

      get_audio_file post_audio_path.join("intro.mp3"), full_url
    end

    # Fetch post intro text
    if flags.include? 'full' and !post.intro.blank?
      full_url = "#{base_url}#{CGI::escape strip_tags(post.full_text)}"
      post.full_audio_url = post_audio_url + 'full.mp3'

      get_audio_file post_audio_path.join("full.mp3"), full_url
    end

    # Fetch post intro text
    if flags.include? 'simple' and !post.full_text.blank?
      full_url = "#{base_url}#{CGI::escape strip_tags(post.full_text)}"
      post.simple_audio_url = post_audio_url + 'simple.mp3'

      get_audio_file post_audio_path.join("simple.mp3"), full_url
    end

    post.save
  end

  def get_audio_file(file_name, url)
    # uri = URI(url)

    # Net::HTTP.start(uri.host, uri.port) do |http|
    #   request = Net::HTTP::Get.new uri.request_uri

    #   http.request request do |response|
    #     open file_name, 'w' do |io|
    #       response.read_body do |chunk|
    #         io.write chunk
    #       end
    #     end
    #   end
    # end

    File.open(file_name, 'wb') do |audio|
      audio << HTTParty.get(url)
    end
  end

  def strip_tags(text)
    sanitizer = HTML::FullSanitizer.new
    sanitizer.sanitize(text)
  end
end