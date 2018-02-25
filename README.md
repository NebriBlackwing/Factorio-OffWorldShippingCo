# Factorio-OffWorldShippingCo
This is factorio mod randomly generates a shipping order, that must be blasted off into space using the rocket silo.

Each time you complete an order, it will push the order level higher. The mod will generate an item list based on scale factor upon the level (20% per level), within a defined range. There is no limit to the level, this will continuously generate orders indefinitely.

The mod uses a pool of items at random to pick from, which currently is limited to the transport-belts + science packs as a proof of concept. As this mod gets further developed the pool of items will increase. Hopefully this mod will give your mega base a production challenge, that will continuously scale up with every fulfilled order.

As a fair warning, this is my first mod. It has not been tested in a multiplayer environment, or with other mods. Please report any issues / bugs on the GitHub issue tracker. I will do my absolute best to resolve any concerns when I can.

Thanks for trying out the mod! Feedback is always welcomed.

Version History (note that my version system reflects the primary version of Factorio, with the last digit representing my revisions.)

    0.15.0 (2018-23-02):
        Initial release.
    0.16.0 (2018-23-02):
        Support for Factorio 0.16.x
    0.16.1 (2018-23-02):
        Fixed dialog suppression when rocket launches without satellite, ensures that the game does not end.
    0.16.2 (2018-24-02):
        - Fixed a potential index out of bounds error.
        - Added more items to the pool of randomly selected items for orders.
