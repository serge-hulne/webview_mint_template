component Centered {
  property children : Array(Html) = []

  style root {
    justify-content: center;
    flex-direction: column;
    align-items: center;
    display: flex;
    padding: 5px;

    font-family: "Open Sans";
    font-weight: bold;
  }

  fun render : Html {
    <div::root>
      children
    </div>
  }
}

/*
Then use it later:
<Centered>
...
</Centered>
*/
