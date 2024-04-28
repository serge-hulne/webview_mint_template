component Counter {
  state val = 0

  fun render : Html {
    <div class="centered">
      <button onClick={handleIncrement}>
        "Click Me!"
      </button>

      <br/>
      <{ Number.toString(val) }>
    </div>
  }

  fun handleIncrement : Promise(Void) {
    let value =
      await `window.increment({addValue: 1, multiplier: 2})
        .then(value => value.count)
        .catch(error => console.log(error))`

    `window.logGo("test")`

    next { val: value }
  }
}
