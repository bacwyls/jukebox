|%
::
:: ::
+$  chat
  $:
  message=cord
  from=ship
  time=@da
  ==
+$  spin
  $:
  media=@t
  author=@ux
  time=@da
  ==
::
+$  admin
  $%
    [%ban =ship]
    [%unban =ship]
  ==
::
::
::
+$  action
  $%
    [%tune tune=(unit @p)]
    [%talk talk=cord]
    [%spin spin]
    [%chat message=cord from=ship time=@da]
    [%viewers viewers=(set ship)]
    [%chatlog chatlog=(list chat)]
    [%presence ~]
    ::
    [%uqbar-spin from=@ux media=@t]
    [%uqbar-tip from=@ux to=@ux amount=@ud]
  ==
--
