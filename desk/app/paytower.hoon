/-  store=jukebox, zig-indexer
/+  rib=jukebox
/+  default-agent, dbug, agentio
=,  format
::
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  $:
  %0
  talk=cord
  =spin:store
  online=_&
  viewers=(map ship time)
  chatlog=(list chat:store)
  banned=(set ship)
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
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+    -.sign  (on-agent:def wire sign)
      %fact
    ?.  =(wire /agentio-watch/batch-order/0x0)
      `this
    =/  spun
      ~(scry-uqbar hc bowl)
    ?.  ?=(%newest-item -.spun)
      `this
    ?>  ?=(%& -.item.spun)
    =/  rice
      ;;([@ @ @] noun.p.item.spun)
    ?:  =(spin.state rice)
      `this
    =.  spin.state
      rice
    :_  this
      (transmit [%spin spin.state])
  ==
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  `this
++  on-save
  ^-  vase
  !>(state)
++  on-init
  ^-  (quip card _this)
  :_  this
  ~&  >  "watching indexer from paytower"
  :~
  %+  watch-our:pass:io
  %indexer
  /batch-order/0x0
  ==
++  on-load  on-load:def
:: ++  on-load
::   |=  old-state=vase
::   ^-  (quip card _this)
::   =/  old  !<(versioned-state old-state)
::   ?-  -.old
::     %0  `this(state old)
::   ==
++  on-leave
  |=  [=path]
  =.  viewers
    (~(del by viewers) src.bowl)
  =/  ships=(set ship)
    ~(key by viewers)
  :_  this
  (transmit [%viewers ships])
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  :: ~&  >>  [%tower %poke src.bowl]
  ?:  (is-banned:rib bowl banned)
    :: ~&  >>>  [%tower %poke-from-banned src.bowl]
    `this
  ?+  mark  (on-poke:def mark vase)
      %noun
    `this
    ::
    :: :: jukebox
      %jukebox-action
    =/  act  !<(action:store vase)
    :: ~&  >>  [%on-poke-tower act]
    ?-  -.act
      :: ::
          %tune     `this
          %viewers  `this
          %chatlog  `this
          ::
          %uqbar-spin  `this
          %uqbar-tip   `this
      :: ::
          %talk
      ?.  permitted:hc
        :: permission denied
        `this
      =.  talk.act
          :: enfore maximum talk
          (crip (scag 64 (trip talk.act)))
      =.  talk.state
          talk.act
      :_  this
      (transmit act)
      :: ::
          %spin
      ?.  =(our.bowl src.bowl)
        `this
      =/  spun
        ~(scry-uqbar hc bowl)
      ?.  ?=(%newest-item -.spun)
        `this
      ?>  ?=(%& -.item.spun)
      =/  rice
        ;;([@ @ @] noun.p.item.spun)
      ?:  =(spin.state rice)
        `this
      =.  spin.state
        rice
      :_  this
      (transmit [%spin spin.state])
      :: ::
          %chat
      :: ?.  permitted:hc  !!
      ::
      :: no spoofing
      =.  from.act  src.bowl
      =.  time.act  now.bowl
      ::
      =/  =chat:store  +.act
      =.  chatlog  [chat chatlog]
      =.  chatlog
        ?:  (gth (lent chatlog) 16)
          (snip chatlog)
        chatlog
      :_  this
      (transmit act)
      :: ::
          %presence
      :: ~&  >  %presence
      ?.  (~(has by viewers) src.bowl)
        `this
      ::
      =.  viewers
        (~(put by viewers) src.bowl now.bowl)
      =/  stale=(list ship)
        (get-stale viewers now.bowl)
      ?~  stale  `this
      =.  viewers
        (remove-viw viewers stale)
      ::
      :_  this
      :-  (transmit-card [%viewers ~(key by viewers)])
      %+  turn  stale
      |=  =ship
      (kick-only:io ship ~[/global /personal])
    ==
    ::
    :: :: jukebox admin
    :: banning stuff
      %jukebox-admin
    ?.  =(src.bowl our.bowl)
      :: only admin
      `this
    ::
    =/  adi  !<(admin:rib vase)
    ?:  =(src.bowl ship.adi)
      :: dont ban yourself lol
      `this
    =.  banned
    (set-banned:rib adi banned)
    ?:  =(%unban -.adi)
      `this
    :: %ban
    =.  viewers
        (~(del by viewers) ship.adi)
    :_  this
    :~
      (kick-only:io ship.adi ~[/personal /global])
      (transmit-card [%viewers ~(key by viewers)])
    ==
  ==
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?:  (is-banned:rib bowl banned)
    :: ~&  >>>  [%tower %watch-from-banned src.bowl]
    `this
  ?.  online
    :_  this
    :: kick everyone
    :~  (kick:io ~[/global /personal])
    ==
  ?+    path
    (on-watch:def path)
      [%global ~]
    :: no initial updates on the group path
    `this
      [%personal ~]
    =.  viewers
      (~(put by viewers) src.bowl now.bowl)
    =/  ships
      ~(key by viewers)
    :: ~&  >  [%tower %personal viewers]
    :_  this
      :~
        (transmit-card [%viewers ships])
        ::
        :: TODO
        ::  during active use, its nice to send this data one bit at a time
        ::  but for the initial state load, it would be better to send
        ::  everything in a single fact
        ::   ::
        ::  unfortunately, this would require a refactor
        ::  or at least junk up the code in some way
        ::  i think there is much room for improvement, and a refactor for this purpose
        ::  will be in order soon
        ::
        (init-fact [%spin spin])
        (init-fact [%tune `our.bowl])
        (init-fact [%viewers ships])
        (init-fact [%chatlog (flop chatlog)])
        ::
        (kick-only:io src.bowl ~[/personal])
      ==
  ==
--
:: ::
:: :: helper core
:: ::
|_  bowl=bowl:gall
++  permitted
  :: dj permissions
  ^-  ?
  =(src.bowl our.bowl)

::
++  init-fact
  |=  act=action:store
  (fact:agentio jukebox-action+!>(act) ~[/personal])
++  transmit-card
  |=  act=action:store
  (fact:agentio jukebox-action+!>(act) ~[/global])
++  transmit
  |=  act=action:store
  :: ~&  >>>  [%tower-transmitting act]
  :~
    (fact:agentio jukebox-action+!>(act) ~[/global])
  ==
::
:: uqbar
++  jukebox-contract-id
  0x3d7a.7477.a55d.721c.3db4.bdc3.b675.96ed.8b3e.0b23.7c0e.6a11.121a.e488.2eee.08c6
++  scry-uqbar-path
  :~
  (scot %p our.bowl)
  %uqbar
  (scot %da now.bowl)
  %indexer  %newest  %item
  (scot %ux jukebox-contract-id)
  %noun
  ==
++  scry-uqbar

  .^(update:zig-indexer %gx scry-uqbar-path)
::
:: presence heartbeat stuff
++  stale-timeout  ~m6
++  get-stale
  |=  [viw=(map ship time) now=time]
  ^-  (list ship)
  =/  vil
    ~(tap by viw)
  |-
  ?~  vil  ~
  ?:  (lth q.i.vil `@da`(sub now stale-timeout))
    :-  p.i.vil
    $(vil t.vil)
  $(vil t.vil)
++  remove-viw
  |=  [viw=(map ship time) stale=(list ship)]
  ^-  (map ship time)
  =.  viw
  |-
  ?~  stale  viw
    =.  viw
    (~(del by viw) i.stale)
    $(stale t.stale)
  viw
::
-- 
