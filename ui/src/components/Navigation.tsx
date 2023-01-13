import React, { FC, useEffect, useState } from 'react';
import { useAppSelector, useAppDispatch } from '../app/hooks';
import { NavItem } from './NavItem';
import { selectTunePatP, selectIsPublic, } from '../features/station/stationSlice';
import { setNavigationOpen, selectNavigationOpen } from '../features/ui/uiSlice';
import { Radio } from '../lib';
import { AccountSelector, HardwareWallet, HotWallet } from '@uqbar/wallet-ui';

interface INavigation {
  our: string;
  tuneTo: ((patp: string|null) => void);
  radio: Radio;
}

interface IMinitower {
  location: string;
  description: string;
  time: number;
  viewers:number;
}

export const Navigation: FC<INavigation> = (props: INavigation) => {

  const {our, tuneTo, radio} = props;
  
  const tunePatP = useAppSelector(selectTunePatP);
  const isPublic = useAppSelector(selectIsPublic);
  const navigationOpen = useAppSelector(selectNavigationOpen);
  const dispatch = useAppDispatch();

  const [towers, setTowers] = useState<Array<IMinitower>>([])
  const [hasPublishedStation, setHasPublishedStation] = useState(false);

  // useEffect(()=>{
  //   radio.api
  //   .subscribe({
  //       app: "tower",
  //       path: "/greg/local",
  //       event: (e)=> {
  //         console.log('greg update', e)
  //         if(!e['response']) return;
          
  //         let newTowers = e.response;
  //         newTowers.sort(function(a:any, b:any) {
  //           return b.viewers - a.viewers;
  //         });
  //         setTowers(e.response);
  //       },
  //       quit: ()=> alert('(greg) lost connection to your urbit. please refresh'),
  //       err: (e)=> console.log('radio err', e),
  //   })
  // }, [])

  // useEffect(()=>{
  //   if(!hasPublishedStation) return;
  //   setInterval(() => {
  //     // heartbeat to detect presence
  //     radio.gregPut('');
  //   }, 1000 * 60 * 3)

  // }, [hasPublishedStation]);


  return(
    <div>
      <div className="mt-2 w-full table">
        <div className="table-cell text-2xl"
          style={{
            width:'3rem'
          }}
        >
          🌺
        </div> 
        {/* tuned to */}
        <div className="table-cell align-middle font-bold"
        >
          jukebox 
        </div>
        <div className="table-cell align-middle text-right">
          {!radio.wallet ?
           <div className="text-yellow-200">
           no wallet detected
           </div>
           :
           <div className="text-green-200">
           {`using ${radio.wallet.pubkey.slice(0,12)}...`}
           </div>
          }
          <AccountSelector onSelectAccount={(a: HotWallet | HardwareWallet) => console.log(a.rawAddress)} />
        </div>
      </div>
      
    </div>
  )
}