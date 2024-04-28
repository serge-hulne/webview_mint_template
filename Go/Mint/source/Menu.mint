component Menu {
  property selectedOption : String = ""
  property handleSelect : Function(Html.Event, Promise(Void))

  fun render : Html {
    <centered>
      <select onChange={handleSelect}>
        <option value="">
          "Menu"
        </option>

        <option value="Home">
          "Home"
        </option>

        <option value="counter">
          "Counter"
        </option>
      </select>

      <centered>
        /*
        <h2>
          <{ selectedOption }>
        </h2>
        */
      </centered>
    </centered>
  }
}
