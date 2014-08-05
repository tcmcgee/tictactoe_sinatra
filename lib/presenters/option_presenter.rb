class OptionPresenter

  def self.make_options(options)
    html = '<form class="start-button" action="/game" method="post">'

    options.each do |key, value|
      html += "<small> #{key} </small>"
      html += "<select name=#{key} size='1'>"
      value.each do |option|
        html += "<option value =#{option}>#{option}</option>"
      end
      html += "</select>"
    end

    html += "<div><input id='start_game' type='submit' value='Start Game'></div>"
    html += '</form>'
  end
end