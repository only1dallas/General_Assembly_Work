<h1>Edit <%= @clown.name %></h1>

<form action="/clowns" method="POST">
  <label>
    Name:
    <input type="text" name="name">
  </label>


<label>
    Talent:
    <input type="text" name="talent">
  </label>

  <label>
    Sings?
    <input type="checkbox" name="is_singer">
  </label>


  <button>Incept this clown</button>

</form>