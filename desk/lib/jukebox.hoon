/-  sur=jukebox
=<  [sur .]
=,  sur
|%
++  agent     %paytenna
++  provider  %paytower
::
++  is-banned
  |=  [=bowl:gall banned=(set ship)]
  ^-  ?
  :: if a ship is banned, so are its kids
  ?|  (~(has in banned) src.bowl)
    ::
    %-  ~(has in banned)
    %-  sein:title
    :-  our.bowl
    :-  now.bowl
    src.bowl
  ==
++  set-banned
  |=  [adi=admin banned=(set ship)]
  ?-  -.adi
      %ban
    (~(put in banned) ship.adi)
      %unban
    (~(del in banned) ship.adi)
  ==
::
++  enjs
  =,  enjs:format
  |%
  ++  admin
    |=  adi=^admin
    ^-  json
    %-  pairs
    :_  ~
    ^-  [cord json]
    :-  -.adi
    ?-  -.adi
    %ban
      [%s (scot %p ship.adi)]
    %unban
      [%s (scot %p ship.adi)]
    ==
  ++  action
    |=  act=^action
    ^-  json
    %-  pairs
    :_  ~
    ^-  [cord json]
    :-  -.act
    ?+  -.act  !!
    %chat
      (enchat +.act)
    %chatlog
      :-  %a
      %+  turn  chatlog.act
      |=  =chat
      (enchat chat)
    %viewers
      (set-ship viewers.act)
    %tune
      (unit-ship tune.act)
    %spin
     %-  pairs
      :~
      ['media' %s media.act]
      ['author' %s (scot %ux author.act)]
      ['time' (sect time.act)]
      ==
    %talk
      [%s talk.act]
    %uqbar-spin
     %-  pairs
      :~
      ['from' %s (scot %ux from.act)]
      ['media' %s media.act]
      ==
    %uqbar-tip
     %-  pairs
      :~
      ['from' %s (scot %ux from.act)]
      ['to' %s (scot %ux to.act)]
      ['amount' (numb amount.act)]
      ==
    ==
  --
++  unit-ship
    |=  who=(unit @p)
    ^-  json
    ?~  who
      ~
    [%s (scot %p u.who)]
++  set-ship
  |=  ships=(set @p)
  ^-  json
  :-  %a
  %+  turn
    ~(tap in ships)
    |=  her=@p
    [%s (scot %p her)]
++  enchat
  |=  [=chat]
  ^-  json
  %-  pairs:enjs
  :~
  ['message' %s message.chat]
  ['from' %s (scot %p from.chat)]
  ['time' (sect:enjs time.chat)]
  ==
::
++  dejs
  =,  dejs:format
  |%
  ++  patp
    (su ;~(pfix sig fed:ag))
  ++  admin
    |=  jon=json
    ^-  ^admin
    =<  (decode jon)
    |%
    ++  decode
      %-  of
      :~
        [%ban patp]
        [%unban patp]
      ==
    --
  ++  action
    |=  jon=json
    ^-  ^action
    :: *^action
    =<  (decode jon)
    |%
    ++  decode
      %-  of
      :~
        [%talk so]
        [%spin spin]
        :: [%view so]
        [%chat chat]
        [%tune (mu patp)]
        [%presence ul]
        [%uqbar-spin uqspin]
        [%uqbar-tip uqtip]
      ==
    ++  chat
      %-  ot
      :~  
          [%message so]
          [%from patp]
          [%time di]
      ==
    ++  spin
      %-  ot
      :~  
          [%media so]
          [%author nu]
          [%time di]
      ==
    ++  uqspin
      %-  ot
      :~  
          [%from nu]
          [%media so]
      ==
    ++  uqtip
      %-  ot
      :~  
          [%from nu]
          [%to nu]
          [%amount ni]
      ==
    ::
    --
  --
--