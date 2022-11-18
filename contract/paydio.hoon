::  paydio spin contract
/=  paydio  /con/lib/paydio
=,  paydio
|_  =context
++  write
  |=  =action:sur
  ^-  (quip call diff)
  ?-    -.action
      %spin
    =/  =spin:sur  [media.action author.action time.action]
    ::
    :: static-id: some static unique id for the spin item, a large random atom hardcoded in lib
    =/  salt    spin-data-salt:lib
    ::
    =/  source   this.context
    =/  holder   this.context
    =/  town     town.context
    ::
    =/  =id
      (hash-data source holder town salt)
    ::
    ::
    :: spin rice... spice
    =/  spice=item
      :*  %&
          id
          source
          holder
          town
          salt
          label=%paydio-spin
          noun=spin
      ==
    ::
    :: =/  event=[@tas json]
    ::   (create-event:lib action)
    ::
    :: TODO charge some zigs from id.from.context into the paydio host wallet 🫰
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
  :: we dont care about the path,
  :: theres only one spin item
  ++  json
    :: =/  mine=(unit item)  (scry-state spin-data-id:lib)
    :: ?~  mine  ~
    :: (spice-to-json:lib u.mine)
    ~
  ++  noun
    :: =/  mine=(unit item)  (scry-state spin-data-id:lib)
    :: ?~  mine  ~
    ::  TODO assert item is data, not pact
    :: noun.u.mine
    ~
  --
--
