import React, { FC, useEffect, useState } from 'react';
import { useAppSelector, useAppDispatch } from '../app/hooks';
import { NavItem } from './NavItem';
import { selectTunePatP, selectIsPublic, } from '../features/station/stationSlice';
import { setNavigationOpen, selectNavigationOpen } from '../features/ui/uiSlice';
import { Radio } from '../lib';

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
      <div className="flex mt-2 align-middle table w-full">
        <span className="text-2xl align-middle">📻</span> 
        {/* tuned to */}
        <span className="flex-full ml-4 px-2 align-middle">
          {tunePatP}
        </span>
      </div>
      
    </div>
  )
}