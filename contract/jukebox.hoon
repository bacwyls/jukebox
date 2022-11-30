::  jukebox spin contract
/=  jukebox  /con/lib/jukebox
=,  jukebox
|_  =context
++  write
  |=  =action:sur
  ^-  (quip call diff)
  ?-    -.action
      %spin
    =/  =spin:sur
      [media.action id.caller.context time.action]
    ::
    =/  salt    spin-data-salt:lib
    ::
    =/  source   this.context
    =/  holder   this.context
    =/  town     town.context
    ::
    =/  =id
      (hash-data source holder town salt)
    ::
    :: spin rice... spice
    =/  spice=item
      :*  %&
          id
          source
          holder
          town
          salt
          label=%jukebox-spin
          noun=spin
      ==
    ::
    =/  mine=(unit item)  (scry-state id)
    ?~  mine
      :: issue spice (only on first call)
      `(result ~ [spice ~] ~ ~)
    :: change spice (all subsequent calls)
    `(result [spice ~] ~ ~ ~)
  ::
  ==
::
++  read
  |_  =path
  ++  json
    ~
  ++  noun
  ::
  ::
    ~
  --
--
