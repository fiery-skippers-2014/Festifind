  def band_photos(tags, photo_count = 12)
    flickr = Flickr.new(File.join(APP_ROOT, 'config', 'flickr.yml'))
    flickr.photos.search(:tags => tags).values_at(0..(photo_count - 1))
  end

  def render_flickr_sidebar_widget(tags, photo_count = 12, columns = 2)
    begin
      @photos = band_photos(tags, photo_count).in_groups_of(2)
      erb :_flicker_sidebar_widget
    rescue Exception
      erb :_flickr_unavailable
    end
  end
