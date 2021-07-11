# AdminNotify
Adds a new type of server notifications for the Administration. These notifications appear on the screen! This plugin will work **exclusively in** [Helix](https://github.com/NebulousCloud/helix) **gamemode 
from** [NebulousCloud](https://github.com/NebulousCloud).

The plugin was developed by **AsterionProject**. Discord of our project: [discord.gg/Cz3EQJ7WrF](https://discord.gg/Cz3EQJ7WrF)
![asterion](https://i.imgur.com/qJtYDKM.png)


An example of how this plugin works:

![gm1](https://i.imgur.com/P4HDh5x.png)
 
 This plugin is already preconfigured. If you want to change anything, then you need to open the file **sh_config.lua**.
 List of functions that the plugin adds:
 ```lua
 -- This function returns several values for normal string output.
 -- @name UniqueID of this notification. Will be called when something happens on the server.
 -- @... has an unlimited number of arguments. Depends on the return from the script call
 -- This function can be called both on the ``CLIENT`` and on the ``SERVER``.
 PLUGIN:AddNewNotify("name", function(...)
     return "Test"
 end)
 
 -- This function sends a notification to all administrations if they are specified in the **sh_config.lua** file
 -- Has a required 1 argument - a @name and an infinite number of unlimited
 -- Can only be called on the ``SERVER``
 PLUGIN:SendNotify("name")
 ```
 
In the **sh_config.lua** file, the ranks for which notifications will be received are predefined. If you want to add new ones, then you will need to rewrite it. Example:

![example](https://i.imgur.com/35rnnqR.png)

```lua
PLUGIN.guiTime = 15 -- How long will the notification stay on the screen
```
