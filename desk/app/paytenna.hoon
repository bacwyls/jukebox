:: paytenna:
::  a crude fork of tenna for uqbar integration
::
/-  store=jukebox,
    w=zig-wallet
/+  jukebox
/+  default-agent, dbug, agentio
=,  format
:: ::
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  $:
  %0
  tune=(unit ship)
  wack=_|
  ==
+$  card     card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
    io    ~(. agentio bowl)
::
++  on-fail   on-fail:def
++  on-peek   on-peek:def
++  on-load  on-load:def
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  `this
++  on-save
  ^-  vase
  !>(state)
++  on-init
  ^-  (quip card _this)
  `this
++  on-leave
  |=  [=path]
  `this
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?~  tune.state  `this
  ?.  =(src.bowl (need tune.state))
    `this
    ?+    -.sign  (on-agent:def wire sign)
        %watch-ack
      =.  wack  &
      `this
        %kick
      ?.  =(wire global)
        `this
      :_  this
      :~
      (poke-self:pass:io tuneout)
      ==
        %fact
      ?+    p.cage.sign  (on-agent:def wire sign)
          %jukebox-action
        :_  this
        :~
          :: fwd to client (frontend) subscription
          (fact:io cage.sign ~[/frontend])
        ==
      ==
    :: ==
  ==
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+  mark  (on-poke:def mark vase)
      %noun
    `this
    ::
    :: :: jukebox
      %jukebox-action
    ?.  =(src.bowl our.bowl)
      `this
    =/  act  !<(action:store vase)
    ?-  -.act
      :: ::
          %viewers  `this
          %chatlog  `this
      :: ::
          %presence
                  :_  this  (fwd act)
          %spin   :_  this  (fwd act)
          %talk   :_  this  (fwd act)
          %chat   :_  this  (fwd act)
      :: ::
      :: ::
          %uqbar-spin
      :: const contract address
      =/  jukebox-pact=@ux
          0x4c11.a949.a311.1404.21dd.4046.23e2.dbf7.f7d0.eb5e.0d38.feb2.1920.a944.268f.dfde
      =/  inner-action
        :*
        %spin
        media.act
        now.bowl
        ==
      =/  =wallet-poke:w
        :*
        %transaction
        from.act      :: from
        jukebox-pact  :: contract
        0x0           :: town
        %noun
        inner-action
        ==
      ::
      :_  this
      :~
        %+  poke:pass:agentio
          [our.bowl %uqbar]
          :-  %wallet-poke
          !>  wallet-poke
      ==
      ::
          %uqbar-tip
      =/  zigs-account-id=@ux
        %:  hash-data:smart:w
            0x74.6361.7274.6e6f.632d.7367.697a
            from.act
            0x0
            `@`'zigs'
        ==
      ::
      :_  this  :_  ~
      :*  %pass  /tip-poke
          %agent  [our.bowl %uqbar]
          %poke  %wallet-poke
          !>  ^-  wallet-poke:w
          :*  %transaction
              from=from.act
              contract=0x74.6361.7274.6e6f.632d.7367.697a
              town=0x0
              :^    %give
                  to.act
                amount.act
              item=zigs-account-id
          ==
      ==
      :: ::
      :: ::
      :: ::
          %tune
      :: leave the old, watch the new
      :: (or dont leave =(old ~))
      :: (or dont watch =(old new))
      :: (or just leave =(new ~))
      =*  new-tune  tune.act
      =/  old-tune  tune
      ::
      =.  tune  new-tune
      ::
      ::
      =/  watt
        (watch new-tune)
      =/  love
        (leave old-tune)
      ::
      ::  cant remember why this broke something
      :: ?:  =(old-tune new-tune)
      ::   `this
      :: 
      :: dont love if not wack
      :: dont leave if never got the watch ack
      ::  handles alien and unbooted providers
      ::  circumvents ames cork crash
      ::   https://github.com/urbit/urbit/issues/6025
      =.  love
          ?:  wack
            love
          ~
      ::
      =.  wack  |
      :: watch new AND/OR leave old
    ::  ~&  >>>  [%watt watt]
    ::  ~&  >>>  [%love love]
      :_  this
      (weld love watt)
    :: ::
    ==
  ==
++  on-watch
  |=  =path
  ::
  :: ~&  >  [%tenna %on-watch path]
  ^-  (quip card _this)
  ?+    path
    (on-watch:def path)
      [%frontend ~]
    `this
  ==
--
:: ::
:: :: helper core
:: ::
|_  bowl=bowl:gall
++  provider  %paytower
++  personal
  [%personal ~]
++  global
  [%global ~]
++  leave
  |=  old-tune=(unit ship)
  ^-  (list card)
  ?~  old-tune  ~
  :~
  [%pass global %agent [u.old-tune provider] %leave ~]
  [%pass personal %agent [u.old-tune provider] %leave ~]
  ==
++  watch
  |=  new-tune=(unit ship)
  ^-  (list card)
  ?~  new-tune
    :~
      (fact:agentio tuneout ~[/frontend])
    ==
  :~
  [%pass global %agent [u.new-tune provider] %watch global]
  [%pass personal %agent [u.new-tune provider] %watch personal]
  ==
++  fwd
  |=  [act=action:store]
  :~
    %+  poke:pass:agentio
      [(need tune.state) provider]
      :-  %jukebox-action
      !>  act
  ==
++  tuneout
  jukebox-action+!>([%tune ~])
-- 
