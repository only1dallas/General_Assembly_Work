require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# get ('/') {binding.pry ; "hello #{params[:name].nil? ? 'world' : params[:name] }"}
# http://localhost:4567/?name=pj
get ('/') {

  '<!doctype html>

<html>
  <head>
    <title>Personal Profile</title>
    <meta charset="utf-8" />
  </head>

  <body>

    <header>Home of the Whopper</header>

    <div id="basic-info" class="personal-info">
      <img src="https://www.gravatar.com/avatar/8e39842a1072c8f67109a6ef86110581?s=300" />
      
      <p>PJ Hughes,<br/>
      September 1, 1980,<br/>
      Hometown: Chagrin Falls, OH

      <p>
        Pets: 
        <ul>
          <li>Rascal,</li>
          <li>Frankie,</li>
          <li>and Cheep-cheep</li>
        </ul>
      </p>

      Color: straight green homie</p>
    </div>
    
    <div id="statement" class="personal-info">
      <p>My personal jihad is writing semantic HTML with no styling.</p>
    </div>

    <nav>
      <a href="">Info Page: Name</a><br/>
      <a href="">Info Page: Hometown</a><br/>
      <a href="">Info Page: Pets</a><br/>
      <a href="">Info Page: Color</a><br/>
    </nav>
    <footer>made with love in NYC by PJ Hughes.</footer>
  </body>
</html>'
}

get ("/name") do "info page html here"

end




