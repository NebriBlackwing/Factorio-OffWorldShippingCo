This mod randomly generates a shipping order that must be blasted off into space using the rocket silo.

Each time you complete an order, it will push the order level higher. The mod will generate an item list based on a scale factor upon the level (20% per level), within a defined range. There is no limit to the level, this will continuously generate orders indefinitely.

Please report any issues / bugs on the GitHub issue tracker. I will do my absolute best to resolve any concerns when I can.

Thanks for trying out the mod! Feedback is always welcomed.

    Planned Features

    - Find a way to output the shipping order demands to circuit network    

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
    0.16.3 (2018-28-02):
        - Internal code clean up
        - fixed bug that caused shipping orders to start at level 200, it now starts at level 1 as intended.
    0.16.4 (2018-08-03)
        - complete mod overhaul!
            - introduced shipping packages
                - factory shipping package
                - modular shipping package
                - rail shipping package
                - oil shipping package
            - introduced shipping package research
        - mod no longer modifies rocket_silo, this should allow all achievements to be completed with   this mod enabled.