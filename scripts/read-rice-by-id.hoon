=ui -build-file /=zig=/sur/zig/indexer/hoon

=id 0x3d7a.7477.a55d.721c.3db4.bdc3.b675.96ed.8b3e.0b23.7c0e.6a11.121a.e488.2eee.08c6

=item-id 0x3d7a.7477.a55d.721c.3db4.bdc3.b675.96ed.8b3e.0b23.7c0e.6a11.121a.e488.2eee.08c6


=spin .^(update:ui %gx /=uqbar=/indexer/item/0x0/[id]/noun)

=spin .^(update:ui %gx /=uqbar=/indexer/item/0x0/0x3d7a.7477.a55d.721c.3db4.bdc3.b675.96ed.8b3e.0b23.7c0e.6a11.121a.e488.2eee.08c6/noun)

?+  -.spin  111
    %item
  =/  li  (~(get ja items.spin) item-id)
  =/  mi  (malt li)
  =/  so  (sort ~(tap in ~(key by (malt li))) gth)
  =/  newest
    %-  ~(got by mi)  -.so
::    +>+>+>.p.item.newest
::  [-.n +<.n +>.n]
  p.item.newest
==

