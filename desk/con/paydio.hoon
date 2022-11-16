::  paydio spin contract
/=  lib  /not/yet/defined/paydio
|_  =cart
++  write
  |=  =action:lib
  ^-  chick
  ?-    -.action
      %spin
    =/  =spin:lib  [media.action author.action time.action]
    :: static-id: some static unique id for the spin grain, a random large atom hardcoded in lib
    :: :: does this *need* to match +fry-rice output? if so..
    :: :: could precompute with some constant lord, holder, town-id, and salt
    ::
    =/  =id     static-id:lib
    =/  salt    static-salt:lib
    ::
    :: spin-grain... spain
    =/  spain=grain
      :*  %&
          salt
          label=%paydio-spin
          data=spin
          id
          lord=me.cart
          holder=me.cart
          town-id=town-id.cart
      ==
    ::
    =/  event=[@tas json]
      (create-event:lib action)
    ::
    :: TODO charge some zigs from id.from.cart into the paydio host wallet ;)
    :: ^ maybe the amount is defined in bid.action, stored in the rice
    ::   and some used to determine permissions & create incentives
    :: probably not necessary for alpha release tho,
    :: i want to keep it as simple as possible
    ::
    =/  mine=(unit grain)  (scry id)
    ?~  mine
      :: issue spain (only on first call)
      (result ~ [spain ~] ~ [event ~])
    :: change spain (all subsequent calls)
    (result [spain ~] ~ ~ [event ~])
  ::
  ==
::
++  read
  |_  =path
  :: we dont care about the path,
  :: theres only one spin grain
  ++  json
    =/  mine=(unit grain)  (scry universal-id:lib)
    ?~  mine  ~
    (spain-to-json:lib u.mine)
  ++  noun
    =/  mine=(unit grain)  (scry universal-id:lib)
    ?~  mine  ~
    data.u.mine
  --
--
