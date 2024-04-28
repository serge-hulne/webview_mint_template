component Main {
  state selectedOption = ""

  fun handleMenuSelect (event : Html.Event) {
    let choice =
      Dom.getValue(event.target)

    next { selectedOption: choice }
  }

  fun render : Html {
    <div::app>
      <Menu
        selectedOption={selectedOption}
        handleSelect={handleMenuSelect}/>

      <br/>

      if selectedOption == "counter" {
        <Counter/>
      } else {
        <Home/>
      }
    </div>
  }

  style app {
    padding: 5px;
    flex-direction: column;
    display: flex;
    height: 100vh;
    width: 100vw;
    font-family: "Open Sans";
    font-weight: bold;
  }

  style centered {
    justify-content: center;
    padding: 5px;
    flex-direction: column;
    align-items: center;
    display: flex;
    font-family: "Open Sans";
    font-weight: bold;
  }
}
