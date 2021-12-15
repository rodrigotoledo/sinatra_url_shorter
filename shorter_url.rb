require 'sinatra'
require "shorturl"

get '/' do
  erb :index
end

post "/" do
  url = params[:url]
  @url_shorted = ShortURL.shorten(url)
  erb :short_result
end

__END__



@@ layout
<html>
  <head>
    <title>Shorter URL</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  </head>

  <body>
    <div class="container">
      <main>
        <%= yield %>
      </main>
    </div>
  </body>
</html>

@@ index
<h1>Shorter URL</h1>
<form action="/" method="post">
  <div class="form-group">
  <label></label>
  <input type="text" name="url" class="form-control" />
  </div>
  <br />
  <input type="submit" class="btn btn-primary" value="Short your URL" />

</form>

@@ error
<%= @error %>

@@ short_result
<h1>Your url now is</h1>
<div class="card">
  <div class="card-body">
    <a href='<%="#{@url_shorted}"%>' target="_blank"><%="#{@url_shorted}"%></a>
  </div>
</div>