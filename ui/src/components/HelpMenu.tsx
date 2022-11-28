import React, { FC } from 'react';

interface IHelpMenu {
  top: number;
  left: number;
}

export const HelpMenu: FC<IHelpMenu> = (props: IHelpMenu) => {

  const {top, left} = props;

  const contractID = '0x4c11.a949.a311.1404.21dd.4046.23e2.dbf7.f7d0.eb5e.0d38.feb2.1920.a944.268f.dfde'
  return(
    <div
      className="p-4 bg-white"
      style={{
        position:'absolute',
        top: top - 50,
        left: left,
        transform: 'translate(-100%, -100%)'
      }}
    >
      <p className='mb-4'> contractID:
        <a href={`/apps/ziggurat/indexer/address/${contractID}`} target='_blank'>
        {' '}{contractID}
        </a>
      </p>
    <p className="">to change the song: </p>
      
      <p className="font-bold ml-2">[%spin url start_time]</p>
      <p className="font-bold ml-2">[%spin 'https://www.youtube.com/watch?v=3vLHelBuTRM' ~2022.11.22..18.51.49..f230]</p>

      {/* <p className="font-bold">
      !set-time
      </p>
      <div className="ml-4 mb-4">

      <p>set the shared timestamp to your current timestamp</p>
      </div> */}
      {/* <p>
      -----------
      </p>
      <p className='italic mb-2'>
      OTHER COMMANDS:
      </p>

      <p className="font-bold">
      !time

      </p>
      <div className="ml-4 mb-4">

      <p>auto scrub to the shared timestamp</p>
      </div> */}
    </div>
  );
};
