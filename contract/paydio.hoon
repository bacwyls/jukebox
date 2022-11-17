::  paydio spin contract
/=  lib  /not/yet/defined/paydio
|_  =context
++  write
  |=  =action:lib
  ^-  (quip call diff)
  ?-    -.action
      %spin
    =/  =spin:lib  [media.action author.action time.action]
    :: static-id: some static unique id for the spin item, a large random atom hardcoded in lib
    ::
    =/  =id     spin-data-id:lib
    =/  salt    420
    ::
    :: spin-rice... spice
    =/  spice=item
      :*  %&
          salt
          label=%paydio-spin
          noun=spin
          id
          source=me.context
          holder=me.context
          town-id=town-id.context
      ==
    ::
    =/  event=[@tas json]
      (create-event:lib action)
    ::
    :: TODO charge some zigs from id.from.context into the paydio host wallet ;)
    :: ^ maybe the amount is defined in bid.action, stored in the rice
    ::   and somehow used to determine permissions / create incentives?
    :: probably not necessary for alpha release tho,
    :: i want to keep it as simple as possible
    ::
    =/  mine=(unit item)  (scry-state id)
    ?~  mine
      :: issue spice (only on first call)
      (result ~ [spice ~] ~ [event ~])
    :: change spice (all subsequent calls)
    (result [spice ~] ~ ~ [event ~])
  ::
  ==
::
++  read
  |_  =path
  :: we dont care about the path,
  :: theres only one spin item
  ++  json
    =/  mine=(unit item)  (scry-state static-spin-id:lib)
    ?~  mine  ~
    (spice-to-json:lib u.mine)
  ++  noun
    =/  mine=(unit item)  (scry static-spin-id:lib)
    ?~  mine  ~
    data.u.mine
  --
--
