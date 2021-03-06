use ".."
use "ponybench"

actor Main
  new create(env: Env) =>
    let bench = PonyBench(env)

    var map = Maps.empty[U64, U64]()
    try map = map.update(0, 0) end

    bench[Map[U64, U64]](
      "insert level 0",
      {(): Map[U64, U64] ? => map.update(1, 1)} val)

    bench[U64](
      "get level 0",
      {(): U64 ? => map(0)} val)

    bench[Map[U64, U64]](
      "update level 0",
      {(): Map[U64, U64] ? => map.update(0, 1)} val)

    bench[Map[U64, U64]](
      "delete level 0",
      {(): Map[U64, U64] ? => map.remove(0)} val)

    bench[Map[U64, U64]](
      "create sub-node",
      {(): Map[U64, U64] ? => map.update(32, 32)} val)

    // expand index 0 into 2 sub-nodes
    try map = map.update(32, 32) end

    bench[Map[U64, U64]](
      "remove sub-node",
      {(): Map[U64, U64] ? => map.remove(32)} val)

    bench[Map[U64, U64]](
      "insert level 1",
      {(): Map[U64, U64] ? => map.update(1, 1)} val)

    bench[U64](
      "get level 1",
      {(): U64 ? => map(0)} val)

    bench[Map[U64, U64]](
      "update level 1",
      {(): Map[U64, U64] ? => map.update(0, 1)} val)

    try map = map.update(1, 1) end

    bench[Map[U64, U64]](
      "delete level 1",
      {(): Map[U64, U64] ? => map.remove(1)} val)
