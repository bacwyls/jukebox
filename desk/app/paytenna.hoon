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
  :: =.  tune
  :: [~ our.bowl]  :: DEFAULT PROVIDER
  `this
++  on-leave
  |=  [=path]
  :: ~&  >>>  [%tenna %on-leave src.bowl]
  `this
  ::
  ::
  ::  actually... this breaks everything
  ::
  :: :_  this
  :: ::
  :: :: this is another layer of protection to clear out stale viewers
  :: :: poke yourself to tune out
  :: :~
  ::   %+  poke:pass:agentio
  ::     [our.bowl %tenna]
  ::     :-  %jukebox-action
  ::     !>  [%tune ~]
  :: ==
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  :: ~&  >>  [%on-agent %tenna wire -.sign]
  ?~  tune.state  `this
  ?.  =(src.bowl (need tune.state))
    `this
  :: ?+    wire  (on-agent:def wire sign)
  ::   [%expected %wire ~]
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
    :: ~&  >  [%tenna %on-poke act]
    ?-  -.act
      :: ::
          %viewers  `this  :: TODO ugly
          %chatlog  `this  :: TODO ugly
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
        from.act  :: from
        jukebox-pact      :: contract
        0x0       :: town
        %noun
        inner-action
        ==
      ::
      ~&  >  ['uqbar spin' wallet-poke]
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
      ~&  >  ['uqbar tip' act]
      :: example tip
      :: :uqbar &wallet-poke [%transaction from=0x7a9a.97e0.ca10.8e1e.273f.0000.8dca.2b04.fc15.9f70 contract=0x74.6361.7274.6e6f.632d.7367.697a town=0x0 action=[%give to=0xd6dc.c8ff.7ec5.4416.6d4e.b701.d1a6.8e97.b464.76de amount=123.456 item=0x89a0.89d8.dddf.d13a.418c.0d93.d4b4.e7c7.637a.d56c.96c0.7f91.3a14.8174.c7a7.71e6]]
      :: =/  zig-pact=@ux
      ::     0x74.6361.7274.6e6f.632d.7367.697a
      :: =/  zig-item=@ux
      ::     0x89a0.89d8.dddf.d13a.418c.0d93.d4b4.e7c7.637a.d56c.96c0.7f91.3a14.8174.c7a7.71e6
      :: =/  inner-action
      ::   :*
      ::   %give
      ::   to.act
      ::   amount.act
      ::   zig-item
      ::   ==
      :: =/  =wallet-poke:w
      ::   :*
      ::   %transaction
      ::   from.act  :: from
      ::   zig-pact  :: contract
      ::   0x0       :: town
      ::   %noun
      ::   inner-action
      ::   ==
      :: :_  this
      :: :~
      ::   %+  poke:pass:agentio
      ::     [our.bowl %uqbar]
      ::     :-  %wallet-poke
      ::     !>  wallet-poke
      :: ==
      ::
      :: old one broke shit lol
      :: stole this from hodzod
      :: =/  user-address=@ux
      ::   =-  ?>  ?=(%addresses -.-)
      ::       (head ~(tap in saved.-))
      ::   .^  wallet-update:wallet  %gx
      ::       /(scot %p our.bowl)/wallet/(scot %da now.bowl)/addresses/noun
      ::   ==
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

